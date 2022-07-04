import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/safety/application/repair/save/safety_repair_save_event.dart';
import 'package:frontend/src/safety/application/repair/save/safety_repair_save_state.dart';
import 'package:frontend/src/safety/domain/usecases/save_safety_repair_info.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SafetyRepairSaveStateNotifier
    extends StateNotifier<SafetyRepairSaveState> {
  SafetyRepairSaveStateNotifier(
      {required SaveSafetyRepairInfo saveSafetyRepairInfo,
      required AuthChangeNotifier authNotifier})
      : _saveSafetyRepairInfo = saveSafetyRepairInfo,
        _authNotifier = authNotifier,
        super(const SafetyRepairSaveState.none());

  final SaveSafetyRepairInfo _saveSafetyRepairInfo;
  final AuthChangeNotifier _authNotifier;

  Future<void> mapEventToState(SafetyRepairSaveEvent event) async {
    event.when(
      saveSafetyRepair: (info) async {
        state = const SafetyRepairSaveState.saving();

        final params = info.toMap();
        params.addAll({
          "user-id": _authNotifier.user!.id,
        });

        final failureOrSuccess = await _saveSafetyRepairInfo(params);
        state = failureOrSuccess.fold(
          (l) => SafetyRepairSaveState.failure(mapFailureToString(l)),
          (r) => const SafetyRepairSaveState.saved(),
        );
      },
    );
  }
}
