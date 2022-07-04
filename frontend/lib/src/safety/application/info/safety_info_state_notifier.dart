import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/safety/application/info/safety_info_event.dart';
import 'package:frontend/src/safety/application/info/safety_info_state.dart';
import 'package:frontend/src/safety/domain/usecases/fetch_safety_infos.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SafetyInfoStateNotifier extends StateNotifier<SafetyInfoState> {
  SafetyInfoStateNotifier({
    required FetchSafetyInfos fetchSafetyInfos,
  })  : _fetchSafetyInfos = fetchSafetyInfos,
        super(const SafetyInfoState.init());

  final FetchSafetyInfos _fetchSafetyInfos;

  Future<void> mapEventToState(SafetyInfoEvent event) async {
    event.when(
      fetchSafetyInfos: (code) async {
        state = const SafetyInfoState.loading();

        final params = {
          "code": code,
        };

        final failureOrResults = await _fetchSafetyInfos(params);

        state = failureOrResults.fold(
          (l) => SafetyInfoState.failure(mapFailureToString(l)),
          (r) => SafetyInfoState.loaded(r),
        );
      },
    );
  }
}
