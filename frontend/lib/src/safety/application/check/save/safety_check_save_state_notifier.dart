import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/safety/infrastructure/dtos/safety_check_dto.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/safety/application/check/save/safety_check_save_event.dart';
import 'package:frontend/src/safety/application/check/save/safety_check_save_state.dart';
import 'package:frontend/src/safety/domain/usecases/save_safety_checks.dart';
import 'package:frontend/src/safety/presentation/viewmodels/safety_check_change_notifier.dart';

class SafetyCheckSaveStateNotifier extends StateNotifier<SafetyCheckSaveState> {
  SafetyCheckSaveStateNotifier({
    required SaveSafetyChecks saveSafetyChecks,
    required SafetyCheckChangeNotifier notifier,
    required String workCode,
    required String workType,
  })  : _saveSafetyChecks = saveSafetyChecks,
        _notifier = notifier,
        _workCode = workCode,
        _workType = workType,
        super(const SafetyCheckSaveState.init());

  final SaveSafetyChecks _saveSafetyChecks;
  final SafetyCheckChangeNotifier _notifier;
  final String _workCode;
  final String _workType;

  Future<void> mapEventToState(SafetyCheckSaveEvent event) async {
    event.when(
      saveChecks: (date) async {
        state = const SafetyCheckSaveState.saving();

        // 저장 정보를 담기 위한 파라미터 리스트
        final parameterList = <Map<String, dynamic>>[];
        for (final item in _notifier.items) {
          final params = SafetyCheckDto.fromDomain(item).toMap();
          params["work-code"] = _workCode;
          params["type"] = _workType;
          params["date"] = date;
          parameterList.add(params);
        }

        final resultsOrFailure = await _saveSafetyChecks(parameterList);
        state = resultsOrFailure.fold(
          (l) => SafetyCheckSaveState.failure(mapFailureToString(l)),
          (r) => const SafetyCheckSaveState.saved(),
        );
      },
    );
  }
}
