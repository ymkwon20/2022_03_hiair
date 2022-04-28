import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/cutting/application/check/save/cutting_check_save_event.dart';
import 'package:frontend/src/cutting/application/check/save/cutting_check_save_state.dart';
import 'package:frontend/src/cutting/domain/usecases/save_cutting_check.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CuttingCheckSaveStateNotifier
    extends StateNotifier<CuttingCheckSaveState> {
  CuttingCheckSaveStateNotifier({
    required SaveCuttingCheck save,
  })  : _save = save,
        super(const CuttingCheckSaveState.initial());

  final SaveCuttingCheck _save;

  Future<void> mapEventToState(CuttingCheckSaveEvent event) async {
    event.when(
      save: (check) async {
        state = const CuttingCheckSaveState.saving();
        final failureOrResult = await _save(check);
        state = failureOrResult.fold(
          (l) => CuttingCheckSaveState.failure(mapFailureToString(l)),
          (r) => const CuttingCheckSaveState.saved(),
        );
      },
    );
  }
}
