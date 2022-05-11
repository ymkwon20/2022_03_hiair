import 'package:frontend/src/auth/presentation/view_model/auth_chage_notifier.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/workorder/application/save/work_order_save_event.dart';
import 'package:frontend/src/workorder/application/save/work_order_save_state.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';
import 'package:frontend/src/workorder/domain/usecases/save_work_order.dart';
import 'package:frontend/src/workorder/domain/usecases/save_work_order_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class WorkOrderSaveStateNotifier extends StateNotifier<WorkOrderSaveState> {
  WorkOrderSaveStateNotifier({
    required SaveWorkOrder saveWorkOrder,
    required SaveWorkOrderList saveWorkOrderList,
    required AuthChangeNotifier auth,
  })  : _saveWorkOrder = saveWorkOrder,
        _saveWorkOrderList = saveWorkOrderList,
        _auth = auth,
        super(const WorkOrderSaveState.none());

  final SaveWorkOrder _saveWorkOrder;
  final SaveWorkOrderList _saveWorkOrderList;
  final AuthChangeNotifier _auth;

  Future<void> mapEventToState(WorkOrderSaveEvent event) async {
    event.when(
      saveWorkOrder: _processSaveQmItem,
      saveWorkOrderList: _processSaveQmList,
      resetToNone: () => state = const WorkOrderSaveState.none(),
    );
  }

  Future<void> _processSaveQmItem(
      WorkOrder item, WorkOrderStatus status, int index) async {
    state = const WorkOrderSaveState.saving();

    final date = DateFormat("yyyy-MM-dd").format(DateTime.now());

    /// DB procedure parameter를 보낼 때,
    /// 다음과 같은 규칙의 문자로 보내게 되어 있음
    ///
    /// W: 대기
    /// S: 투입
    /// E: 종료
    late String qmStatus;
    switch (status) {
      case WorkOrderStatus.start:
        qmStatus = "S";
        break;
      case WorkOrderStatus.end:
        qmStatus = "E";
        break;
    }

    final params = {
      "plan-seq": item.planSeq.toString(),
      "wo-nb": item.code,
      "wb-cd": _auth.user!.wbCd,
      "prod-gb": qmStatus,
      "date": date,
      "qty": item.qty.toString(),
    };

    final resultsOrFailure = await _saveWorkOrder(params);
    state = resultsOrFailure.fold(
      (l) => WorkOrderSaveState.failure(mapFailureToString(l)),
      (r) => WorkOrderSaveState.oneSaved(index, date, status),
    );
  }

  Future<void> _processSaveQmList(
      List<WorkOrder> list, WorkOrderStatus status, List<int> indice) async {
    state = const WorkOrderSaveState.saving();

    /// _processSaveQmItem(_,__,___) 참고
    late String qmStatus;
    switch (status) {
      case WorkOrderStatus.start:
        qmStatus = "S";
        break;
      case WorkOrderStatus.end:
        qmStatus = "E";
        break;
    }

    final date = DateFormat("yyyy-MM-dd").format(DateTime.now());

    final params = <Map<String, dynamic>>[];

    for (final item in list) {
      final mapData = {
        "plan-seq": item.planSeq.toString(),
        "wo-nb": item.code,
        "wb-cd": _auth.user!.wbCd,
        "prod-gb": qmStatus,
        "date": date,
        "qty": item.qty.toString(),
      };
      params.add(mapData);
    }

    final resultsOrFailure = await _saveWorkOrderList(params);
    state = resultsOrFailure.fold(
      (l) => WorkOrderSaveState.failure(mapFailureToString(l)),
      (r) => WorkOrderSaveState.multipleSaved(indice, date, status),
    );
  }
}
