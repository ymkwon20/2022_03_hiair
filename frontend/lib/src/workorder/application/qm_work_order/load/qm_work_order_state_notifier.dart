import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/workorder/application/qm_work_order/load/qm_work_order_event.dart';
import 'package:frontend/src/workorder/application/qm_work_order/load/qm_work_order_state.dart';
import 'package:frontend/src/workorder/domain/usecases/fetch_qm_work_order_list.dart';
import 'package:frontend/src/workorder/domain/usecases/search_qm_work_order_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QmWorkOrderStateNotifier extends StateNotifier<QmWorkOrderState> {
  QmWorkOrderStateNotifier({
    required FetchQmWorkOrderList fetchQmItems,
    required SearchQmWorkOrderList searchQmWorkOrderList,
  })  : _fetchItems = fetchQmItems,
        _searchQmWorkOrderList = searchQmWorkOrderList,
        super(const QmWorkOrderState.initial());

  final FetchQmWorkOrderList _fetchItems;
  final SearchQmWorkOrderList _searchQmWorkOrderList;

  Future<void> mapEventToState(QmWorkOrderEvent event) async {
    event.when(
      fetchListByPage: () async {
        state = const QmWorkOrderState.loading();

        final resultsOrFailure = await _fetchItems();
        state = resultsOrFailure.fold(
          (l) => QmWorkOrderState.failure(mapFailureToString(l)),
          (r) => QmWorkOrderState.loaded(r.items, r.isNextAvailable),
        );
      },
      searchQMList: (startDate, endDate) async {
        state = const QmWorkOrderState.loading();

        final params = {
          "startDate": startDate,
          "endDate": endDate,
        };

        final resultsOrFailure = await _searchQmWorkOrderList(params);
        state = resultsOrFailure.fold(
          (l) => QmWorkOrderState.failure(mapFailureToString(l)),
          (r) => QmWorkOrderState.loaded(r.items, r.isNextAvailable),
        );
      },
    );
  }
}
