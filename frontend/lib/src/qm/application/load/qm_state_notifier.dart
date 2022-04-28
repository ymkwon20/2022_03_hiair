import 'package:frontend/src/auth/presentation/view_model/auth_chage_notifier.dart';
import 'package:frontend/src/core/constants/logic_constant.dart';
import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/qm/application/load/qm_event.dart';
import 'package:frontend/src/qm/application/load/qm_state.dart';
import 'package:frontend/src/qm/domain/entities/qm_item.dart';
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
      fetchQmItemsByPage: (int page, List<QmItem> previousItems) async {
        state = QmState.loading(previousItems, LogicConstant.qmFetchCount);

        final params = {
          "wb-cd": _auth.user!.wbCd,
          "page": page,
        };

        final resultsOrFailure = await _fetchQmItems(params);
        state = resultsOrFailure.fold(
          (l) => QmState.failure(previousItems, mapFailureToString(l)),
          (r) => QmState.loaded(previousItems..addAll(r)),
        );
      },
    );
  }
}
