import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/workorderCurrent/application/current_work_order_event.dart';
import 'package:frontend/src/workorderCurrent/application/current_work_order_state.dart';
import 'package:frontend/src/workorderCurrent/domain/usecases/fetch_current_work_order_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrentWorkOrderStateNotifier
    extends StateNotifier<CurrentWorkOrderState> {
  CurrentWorkOrderStateNotifier({
    required FetchCurrentWorkOrderList fetchCurrentItems,
  })  : _fetchCurrentItems = fetchCurrentItems,
        super(const CurrentWorkOrderState.initial([]));

  final FetchCurrentWorkOrderList _fetchCurrentItems;

  Future<void> mapEventToState(CurrentWorkOrderEvent event) async {
    event.when(
      fetchCurrentWorkOrder: (items, yard, hullNo) async {
        state = CurrentWorkOrderState.loading(items);

        final params = {
          "yard": yard,
          "hullno": hullNo,
        };

        final resultsOrFailure = await _fetchCurrentItems(params);

        state = resultsOrFailure.fold(
          (l) => CurrentWorkOrderState.failure(items, mapFailureToString(l)),
          (r) => CurrentWorkOrderState.loaded(items..addAll(r.items)),
        );
      },
    );
  }
}
