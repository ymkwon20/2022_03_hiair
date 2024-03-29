import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/presentation/logic_constant.dart';
import 'package:frontend/src/impeller/application/impeller/load/impeller_event.dart';
import 'package:frontend/src/impeller/application/impeller/load/impeller_state.dart';
import 'package:frontend/src/impeller/domain/usecases/fetch_impeller_list.dart';
import 'package:frontend/src/impeller/domain/usecases/fetch_impeller_single_list.dart';
import 'package:frontend/src/impeller/domain/usecases/search_impeller_list.dart';
import 'package:frontend/src/work_base/presentation/work_base_change_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImpellerStateNotifier extends StateNotifier<ImpellerState> {
  ImpellerStateNotifier({
    required FetchImpellerList fetchItems,
    required FetchImpellerSingleList fetchImpellerSingleList,
    required SearchImpellerList searchItems,
    required WorkBaseChangeNotifier workbase,
  })  : _workbase = workbase,
        _fetchItems = fetchItems,
        _fetchImpellerSingleList = fetchImpellerSingleList,
        _searchItems = searchItems,
        super(const ImpellerState.initial([]));

  final FetchImpellerList _fetchItems;
  final FetchImpellerSingleList _fetchImpellerSingleList;
  final WorkBaseChangeNotifier _workbase;
  final SearchImpellerList _searchItems;

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
      fetchSingleListByPage: (items, page) async {
        state = ImpellerState.loading(items, LogicConstant.qmFetchCount);

        final params = {
          "wb-cd": _workbase.workBase!.wbCode,
          "wc-cd": _workbase.workBase!.wcCode,
          "page": page,
        };

        final resultsOrFailure = await _fetchImpellerSingleList(params);
        state = resultsOrFailure.fold(
          (l) => ImpellerState.failure(items, mapFailureToString(l)),
          (r) =>
              ImpellerState.loaded(items..addAll(r.items), r.isNextAvailable),
        );
      },
      searchByYardHullNo: (items, page, yard, hullNo) async {
        state = ImpellerState.loading(items, LogicConstant.qmFetchCount);

        final params = {
          "wb-cd": _workbase.workBase!.wbCode,
          "wc-cd": _workbase.workBase!.wcCode,
          "yard": yard,
          "hullno": hullNo,
        };

        final resultsOrFailure = await _searchItems(params);
        state = resultsOrFailure.fold(
          (l) => ImpellerState.failure(items, mapFailureToString(l)),
          (r) =>
              ImpellerState.loaded(items..addAll(r.items), r.isNextAvailable),
        );
      },
    );
  }
}
