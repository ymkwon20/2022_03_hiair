import 'package:frontend/src/auth/presentation/view_model/auth_chage_notifier.dart';
import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/fct/application/save/fct_save_event.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/fct/application/save/fct_save_state.dart';
import 'package:frontend/src/fct/domain/usecases/save_fct_items.dart';

class FctSaveStateNotifier extends StateNotifier<FctSaveState> {
  FctSaveStateNotifier(
      {required SaveFctItems saveFctItem, required AuthChangeNotifier auth})
      : _saveFctItems = saveFctItem,
        _auth = auth,
        super(const FctSaveState.init());

  final SaveFctItems _saveFctItems;
  final AuthChangeNotifier _auth;

  Future<void> mapEventToState(FctSaveEvent event) async {
    event.when(
      saveFctItem: (items) async {
        state = const FctSaveState.saving();

        final params = <Map<String, dynamic>>[];

        for (final item in items) {
          final mapData = {
            "date": item.date,
            "seq": item.seq.toString(),
            "wb-cd": item.wbCd,
            "metal": item.metal,
            "remark": item.remark,
            "qty": item.cutQty.toString(),
            "user-id": _auth.user!.id,
          };
          params.add(mapData);
        }

        final failureOrSuccess = await _saveFctItems(params);

        state = failureOrSuccess.fold(
          (l) => FctSaveState.failure(mapFailureToString(l)),
          (r) => const FctSaveState.saved(),
        );
      },
    );
  }
}
