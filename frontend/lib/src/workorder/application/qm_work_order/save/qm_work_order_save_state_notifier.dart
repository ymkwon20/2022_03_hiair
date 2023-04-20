import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/workorder/application/qm_work_order/save/qm_work_order_save_event.dart';
import 'package:frontend/src/workorder/application/qm_work_order/save/qm_work_order_save_state.dart';
import 'package:frontend/src/workorder/domain/entities/qm_work_order.dart';
import 'package:frontend/src/workorder/domain/usecases/save_qm_work_order.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class QmWorkOrderSaveStateNotifier extends StateNotifier<QmWorkOrderSaveState> {
  QmWorkOrderSaveStateNotifier({
    required SaveQmWorkOrder saveQmWorkOrder,
    required AuthChangeNotifier authNotifier,
  })  : _saveQmWorkOrder = saveQmWorkOrder,
        _authNotifier = authNotifier,
        super(const QmWorkOrderSaveState.none());

  final SaveQmWorkOrder _saveQmWorkOrder;
  final AuthChangeNotifier _authNotifier;

  Future<void> mapEventToState(QmWorkOrderSaveEvent event) async {
    event.when(
      saveQmWorkOrder: _processSaveWorkorder,
      saveQmWorkOrderList: _processSaveWorkorderList,
      resetToNone: () => state = const QmWorkOrderSaveState.none(),
    );
  }

  Future<void> _processSaveWorkorder(QmWorkOrder item, int index) async {
    state = const QmWorkOrderSaveState.saving();

    final date = DateFormat("yyyy-MM-dd").format(DateTime.now());

    final params = {
      "plan-seq": item.planSeq.toString(),
      "wo-nb": item.code,
      "date": date,
      "user-id": _authNotifier.user!.id,
    };

    final resultsOrFailure = await _saveQmWorkOrder(params);
    state = resultsOrFailure.fold(
      (l) => QmWorkOrderSaveState.failure(mapFailureToString(l)),
      (r) => QmWorkOrderSaveState.saved(index),
    );
  }

  Future<void> _processSaveWorkorderList(
      List<QmWorkOrder> list, List<int> indice) async {
    state = const QmWorkOrderSaveState.saving();

    final date = DateFormat("yyyy-MM-dd").format(DateTime.now());

    for (int i = 0; i < indice.length; i++) {
      final item = list[i];
      final index = indice[i];
      final params = {
        "plan-seq": item.planSeq.toString(),
        "wo-nb": item.code,
        "date": date,
        "user-id": _authNotifier.user!.id,
      };

      final resultsOrFailure = await _saveQmWorkOrder(params);
      state = resultsOrFailure.fold(
        (l) => QmWorkOrderSaveState.failure(mapFailureToString(l)),
        (r) => QmWorkOrderSaveState.saved(index),
      );
    }
  }
}
