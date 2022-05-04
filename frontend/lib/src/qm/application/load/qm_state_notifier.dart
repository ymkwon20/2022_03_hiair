import 'package:frontend/src/auth/presentation/view_model/auth_chage_notifier.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/qm/application/load/qm_event.dart';
import 'package:frontend/src/qm/application/load/qm_state.dart';
import 'package:frontend/src/qm/domain/usecases/fetch_qm_items.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QmStateNotifier extends StateNotifier<QmState> {
  QmStateNotifier({
    required FetchQmItems fetchQmItems,
    required AuthChangeNotifier auth,
  })  : _auth = auth,
        _fetchQmItems = fetchQmItems,
        super(const QmState.initial([]));

  final FetchQmItems _fetchQmItems;
  final AuthChangeNotifier _auth;

  Future<void> mapEventToState(QmEvent event) async {
    event.when(
      fetchQmItemsByPage: (items, page) async {
        state = QmState.loading(items, LogicConstant.qmFetchCount);

        final params = {
          "wb-cd": _auth.user!.wbCd,
          "page": page,
        };

        final resultsOrFailure = await _fetchQmItems(params);
        state = resultsOrFailure.fold(
          (l) => QmState.failure(items, mapFailureToString(l)),
          (r) => QmState.loaded(items..addAll(r)),
        );
      },
    );
  }
}
