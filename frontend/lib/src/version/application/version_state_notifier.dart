import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/version/application/version_event.dart';
import 'package:frontend/src/version/domain/usecases/fetch_local_version.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/version/application/version_state.dart';
import 'package:frontend/src/version/domain/usecases/fetch_latest_version.dart';

class VersionStateNotifier extends StateNotifier<VersionState> {
  VersionStateNotifier({
    required FetchLatestVersion fetchLatest,
    required FetchLocalVersion fetchLocal,
  })  : _fetchLatest = fetchLatest,
        _fetchLocal = fetchLocal,
        super(const VersionState.init());

  final FetchLatestVersion _fetchLatest;
  final FetchLocalVersion _fetchLocal;

  late String localVersion;
  late String latestVersion;

  Future<void> mapEventToState(VersionEvent event) async {
    event.when(
      checkVersion: () async {
        state = const VersionState.checking();

        localVersion = await _fetchLocal();
        final failureOrRemoteVersion = await _fetchLatest();

        failureOrRemoteVersion.fold(
          (l) => state = VersionState.failure(mapFailureToString(l)),
          (r) {
            latestVersion = r;
            if (localVersion == latestVersion) {
              state = VersionState.upToDate(latestVersion);
            } else {
              state = VersionState.outdated(localVersion, latestVersion);
            }
          },
        );
      },
    );
  }
}
