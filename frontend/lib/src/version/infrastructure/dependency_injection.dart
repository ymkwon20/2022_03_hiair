import 'package:frontend/src/core/dependency_injection.dart';
import 'package:frontend/src/version/application/version_state.dart';
import 'package:frontend/src/version/application/version_state_notifier.dart';
import 'package:frontend/src/version/domain/repositories/i_version_repository.dart';
import 'package:frontend/src/version/domain/usecases/fetch_latest_apk_version.dart';
import 'package:frontend/src/version/infrastructure/datasources/remote/version_remote_service.dart';
import 'package:frontend/src/version/infrastructure/datasources/version_service.dart';
import 'package:frontend/src/version/infrastructure/repositories/version_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//! application
final versionStateNotifierProvider =
    StateNotifierProvider<VersionStateNotifier, VersionState>(
  (ref) => VersionStateNotifier(fetchLatest: ref.watch(fetchLatestProvider)),
);

//! usecase
final fetchLatestProvider = Provider(
  (ref) =>
      FetchLatestApkVersion(repository: ref.watch(versionRepositoryProvider)),
);

//! repository
final versionRepositoryProvider = Provider<IVersionRepository>(
  (ref) => VersionRepository(remote: ref.watch(versionRemoteServiceProvider)),
);

//! datasource
final versionRemoteServiceProvider = Provider<VersionService>(
  (ref) => VersionRemoteService(httpClient: ref.watch(dioProvider)),
);
