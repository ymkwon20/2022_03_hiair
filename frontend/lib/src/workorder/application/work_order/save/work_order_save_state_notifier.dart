import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/checklist/domain/usecases/fetch_and_save_checklist.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/workorder/application/work_order/save/work_order_save_event.dart';
import 'package:frontend/src/workorder/application/work_order/save/work_order_save_state.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';
import 'package:frontend/src/workorder/domain/usecases/save_work_order.dart';
import 'package:frontend/src/workorder/domain/usecases/save_work_order_list.dart';
import 'package:frontend/src/workorder/domain/usecases/start_cancel_work_order.dart';
import 'package:frontend/src/workorder/domain/usecases/start_cancel_work_order_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class WorkOrderSaveStateNotifier extends StateNotifier<WorkOrderSaveState> {
  WorkOrderSaveStateNotifier({
    required SaveWorkOrder saveWorkOrder,
    required SaveWorkOrderList saveWorkOrderList,
    required StartCancelWorkOrder startCancelWorkOrder,
    required StartCancelWorkOrderList startCancelWorkOrderList,
    required FetchAndSaveChecklist fetchAndSaveChecklist,
    required AuthChangeNotifier authNotifier,
  })  : _saveWorkOrder = saveWorkOrder,
        _saveWorkOrderList = saveWorkOrderList,
        _startCancelWorkOrder = startCancelWorkOrder,
        _startCancelWorkOrderList = startCancelWorkOrderList,
        _fetchAndSaveChecklist = fetchAndSaveChecklist,
        _authNotifier = authNotifier,
        super(const WorkOrderSaveState.none());

  final SaveWorkOrder _saveWorkOrder;
  final SaveWorkOrderList _saveWorkOrderList;
  final StartCancelWorkOrder _startCancelWorkOrder;
  final StartCancelWorkOrderList _startCancelWorkOrderList;
  final FetchAndSaveChecklist _fetchAndSaveChecklist;
  final AuthChangeNotifier _authNotifier;

  Future<void> mapEventToState(WorkOrderSaveEvent event) async {
    event.when(
      saveWorkOrder: _processSaveWorkorder,
      saveWorkOrderList: _processSaveWorkorderList,
      resetToNone: () => state = const WorkOrderSaveState.none(),
    );
  }

  Future<void> _processSaveWorkorder(
      WorkOrder item, WorkOrderSaveStatus status, int index) async {
    state = const WorkOrderSaveState.saving();

    final date = DateFormat("yyyy-MM-dd").format(DateTime.now());

    /// DB procedure parameter를 보낼 때,
    /// 다음과 같은 규칙의 문자로 보내게 되어 있음
    ///
    /// W: 대기
    /// S: 투입
    /// E: 종료
    ///
    /// qmStatus가 SC => Start Cancel
    late String qmStatus;
    switch (status) {
      case WorkOrderSaveStatus.start:
        qmStatus = "S";
        break;
      case WorkOrderSaveStatus.end:
        qmStatus = "E";
        break;
      case WorkOrderSaveStatus.all:
        qmStatus = "A";
        break;
      case WorkOrderSaveStatus.startCancel:
        qmStatus = "SC";
        break;
    }

    if (qmStatus == "SC") {
      final params = {
        "plan-seq": item.planSeq.toString(),
        "wo-nb": item.code,
        "wc-cd": item.wcCd,
        "wb-cd": item.wbCd,
      };

      final resultsOrFailure = await _startCancelWorkOrder(params);
      state = resultsOrFailure.fold(
        (l) => WorkOrderSaveState.failure(mapFailureToString(l)),
        (r) => WorkOrderSaveState.oneSaved(index, date, status),
      );
    } else {
      final params = {
        "plan-seq": item.planSeq.toString(),
        "wo-nb": item.code,
        "wb-cd": item.wbCd,
        "wc-cd": item.wcCd,
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
  }

  Future<void> _processSaveWorkorderList(List<WorkOrder> list,
      WorkOrderSaveStatus status, List<int> indice) async {
    state = const WorkOrderSaveState.saving();

    final date = DateFormat("yyyy-MM-dd").format(DateTime.now());

    late String qmStatus;
    switch (status) {
      case WorkOrderSaveStatus.start:
        qmStatus = "S";
        break;
      case WorkOrderSaveStatus.end:
        qmStatus = "E";
        break;
      case WorkOrderSaveStatus.all:
        qmStatus = "A";
        break;
      case WorkOrderSaveStatus.startCancel:
        qmStatus = "SC";
        break;
    }

    if (qmStatus == "SC") {
      final params = <Map<String, dynamic>>[];

      final resultsOrFailure = await _startCancelWorkOrderList(params);

      state = resultsOrFailure.fold(
        (l) => WorkOrderSaveState.failure(mapFailureToString(l)),
        (r) => WorkOrderSaveState.multipleSaved(indice, date, status),
      );
    } else {
      final params = <Map<String, dynamic>>[];

      var isSuccess = false;
      for (final item in list) {
        final mapData = {
          "plan-seq": item.planSeq.toString(),
          "wo-nb": item.code,
          "wb-cd": item.wbCd,
          "wc-cd": item.wcCd,
          "prod-gb": qmStatus,
          "date": date,
          "qty": item.qty.toString(),
          "page-cd": "",
          "user-id": _authNotifier.user!.id,
        };

        switch (status) {
          case WorkOrderSaveStatus.start:
            isSuccess = true;
            break;
          default:
            final failureOrSuccess = await _fetchAndSaveChecklist(mapData);

            failureOrSuccess.fold(
              (l) {
                state = WorkOrderSaveState.failure(mapFailureToString(l));
                isSuccess = false;
              },
              (r) {
                isSuccess = true;
              },
            );
            break;
        }

        if (!isSuccess) {
          break;
        } else {
          params.add(mapData);
        }
      }

      if (isSuccess) {
        final resultsOrFailure = await _saveWorkOrderList(params);
        state = resultsOrFailure.fold(
          (l) => WorkOrderSaveState.failure(mapFailureToString(l)),
          (r) => WorkOrderSaveState.multipleSaved(indice, date, status),
        );
      }
    }
  }
}
