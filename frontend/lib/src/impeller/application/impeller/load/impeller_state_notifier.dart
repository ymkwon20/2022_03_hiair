import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/presentation/logic_constant.dart';
import 'package:frontend/src/impeller/application/impeller/load/impeller_event.dart';
import 'package:frontend/src/impeller/application/impeller/load/impeller_state.dart';
import 'package:frontend/src/impeller/domain/usecases/fetch_impeller_list.dart';
import 'package:frontend/src/work_base/presentation/work_base_change_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImpellerStateNotifier extends StateNotifier<ImpellerState> {
  ImpellerStateNotifier({
    required FetchImpellerList fetchItems,
    required WorkBaseChangeNotifier workbase,
  })  : _workbase = workbase,
        _fetchItems = fetchItems,
        super(const ImpellerState.initial([]));

  final FetchImpellerList _fetchItems;
  final WorkBaseChangeNotifier _workbase;

  Future<void> mapEventToState(ImpellerEvent event) async {
    event.when(
      fetchListByPage: (items, page) async {
        state = ImpellerState.loading(items, LogicConstant.qmFetchCount);

        final params = {
          "wb-cd": _workbase.workBase!.wbCode,
          "wc-cd": _workbase.workBase!.wcCode,
          "page": page,
        };

        final resultsOrFailure = await _fetchItems(params);
        state = resultsOrFailure.fold(
          (l) => ImpellerState.failure(items, mapFailureToString(l)),
          (r) =>
              ImpellerState.loaded(items..addAll(r.items), r.isNextAvailable),
        );
      },
    );
  }
}
