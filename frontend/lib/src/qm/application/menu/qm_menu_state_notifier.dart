import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/qm/application/menu/qm_menu_event.dart';
import 'package:frontend/src/qm/application/menu/qm_menu_state.dart';
import 'package:frontend/src/qm/domain/usecases/fetch_qm_menulist.dart';

class QmMenuStateNotifier extends StateNotifier<QmMenuState> {
  QmMenuStateNotifier({
    required FetchQmMenulist fetchQmMenulist,
  })  : _fetchQmMenulist = fetchQmMenulist,
        super(const QmMenuState.init());

  final FetchQmMenulist _fetchQmMenulist;

  Future<void> mapEventToState(QmMenuEvent event) async {
    event.when(
      fetchQmMenulist: () async {
        state = const QmMenuState.loading();

        /// 이후에 따로 사용되지 않기 때문에 효율성을 위해 hardcoded value를 넣어줌
        final params = {"code": "Q"};

        final failureOrResults = await _fetchQmMenulist(params);

        state = failureOrResults.fold(
          (l) => QmMenuState.failure(mapFailureToString(l)),
          (r) => QmMenuState.loaded(r),
        );
      },
    );
  }
}
