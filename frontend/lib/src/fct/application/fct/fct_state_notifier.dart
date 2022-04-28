import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/fct/application/fct/fct_event.dart';
import 'package:frontend/src/fct/application/fct/fct_state.dart';
import 'package:frontend/src/fct/domain/usecases/get_fct_items.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FctStateNotifier extends StateNotifier<FctState> {
  FctStateNotifier({
    required GetFctItems getFctItem,
  })  : _getFctItem = getFctItem,
        super(const FctState.init());

  final GetFctItems _getFctItem;

  Future<void> mapEventToState(FctEvent event) async {
    event.when(
      getFctItems: (serial) async {
        state = const FctState.loading();

        final failureOrSuccess = await _getFctItem(serial);
        state = failureOrSuccess.fold(
          (l) => FctState.failure(mapFailureToString(l)),
          (r) => FctState.loaded(r),
        );
      },
    );
  }
}
