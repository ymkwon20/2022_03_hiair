import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/work_base/presentation/work_base_change_notifier.dart';
import 'package:frontend/src/workorder/application/work_order/load/work_order_event.dart';
import 'package:frontend/src/workorder/application/work_order/load/work_order_state.dart';
import 'package:frontend/src/workorder/domain/usecases/fetch_work_order_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkOrderStateNotifier extends StateNotifier<WorkOrderState> {
  WorkOrderStateNotifier({
    required FetchWorkOrderList fetchItems,
    required WorkBaseChangeNotifier workbase,
  })  : _workbase = workbase,
        _fetchItems = fetchItems,
        super(const WorkOrderState.initial([]));

  final FetchWorkOrderList _fetchItems;
  final WorkBaseChangeNotifier _workbase;

  Future<void> mapEventToState(WorkOrderEvent event) async {
    event.when(
      fetchListByPage: (items, page) async {
        state = WorkOrderState.loading(items, LogicConstant.qmFetchCount);

        final params = {
          "wb-cd": _workbase.workBase!.wbCode,
          "wc-cd": _workbase.workBase!.wcCode,
          "page": page,
        };

        final resultsOrFailure = await _fetchItems(params);
        state = resultsOrFailure.fold(
          (l) => WorkOrderState.failure(items, mapFailureToString(l)),
          (r) =>
              WorkOrderState.loaded(items..addAll(r.items), r.isNextAvailable),
        );
      },
    );
  }
}
