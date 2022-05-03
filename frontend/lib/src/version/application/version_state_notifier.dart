import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/version/application/version_event.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/version/application/version_state.dart';
import 'package:frontend/src/version/domain/usecases/fetch_latest_apk_version.dart';

class VersionStateNotifier extends StateNotifier<VersionState> {
  VersionStateNotifier({
    required FetchLatestApkVersion fetchLatest,
  })  : _fetchLatest = fetchLatest,
        super(const VersionState.init());

  final FetchLatestApkVersion _fetchLatest;

  Future<void> mapEventToState(VersionEvent event) async {
    event.when(
      fetchLatestApkVersionNo: () async {
        state = const VersionState.loading();

        final failureOrResults = await _fetchLatest();

        state = failureOrResults.fold(
          (l) => VersionState.failure(mapFailureToString(l)),
          (r) => VersionState.loaded(r),
        );
      },
    );
  }
}
