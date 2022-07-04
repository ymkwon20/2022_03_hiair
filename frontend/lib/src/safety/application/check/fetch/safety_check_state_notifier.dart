import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/safety/application/check/fetch/safety_check_event.dart';
import 'package:frontend/src/safety/application/check/fetch/safety_check_state.dart';
import 'package:frontend/src/safety/presentation/viewmodels/safety_info_change_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/safety/domain/usecases/fetch_safety_checks.dart';

class SafetyCheckStateNotifier extends StateNotifier<SafetyCheckState> {
  SafetyCheckStateNotifier({
    required FetchSafetyChecks fetchSafetyChecks,
    required SafetyInfoChangeNotifier infoNotifier,
  })  : _fetchSafetyChecks = fetchSafetyChecks,
        super(const SafetyCheckState.init());

  final FetchSafetyChecks _fetchSafetyChecks;

  Future<void> mapEventToState(SafetyCheckEvent event) async {
    event.when(
      fetchSafetyChecks: (code, type, date) async {
        state = const SafetyCheckState.loading();

        final params = <String, dynamic>{
          "code": code,
          "date": date,
          "type": type,
        };

        final resultsOrFailure = await _fetchSafetyChecks(params);

        state = resultsOrFailure.fold(
          (l) => SafetyCheckState.failure(mapFailureToString(l)),
          (r) => SafetyCheckState.loaded(r),
        );
      },
    );
  }
}
