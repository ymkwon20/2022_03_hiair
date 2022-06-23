import 'package:frontend/src/core/dependency_injection.dart';
import 'package:frontend/src/version/application/version_state.dart';
import 'package:frontend/src/version/application/version_state_notifier.dart';
import 'package:frontend/src/version/domain/repositories/i_version_repository.dart';
import 'package:frontend/src/version/domain/usecases/fetch_latest_version.dart';
import 'package:frontend/src/version/domain/usecases/fetch_local_version.dart';
import 'package:frontend/src/version/infrastructure/datasources/local/version_local_service.dart';
import 'package:frontend/src/version/infrastructure/datasources/local/version_package_info_local_service.dart';
import 'package:frontend/src/version/infrastructure/datasources/remote/version_dio_remote_service.dart';
import 'package:frontend/src/version/infrastructure/datasources/remote/version_remove_service.dart';
import 'package:frontend/src/version/infrastructure/repositories/version_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

//! application
final versionStateNotifierProvider =
    StateNotifierProvider<VersionStateNotifier, VersionState>(
  (ref) => VersionStateNotifier(
    fetchLatest: ref.watch(fetchLatestProvider),
    fetchLocal: ref.watch(fetchLocalProvider),
  ),
);

//! usecase
final fetchLatestProvider = Provider(
  (ref) => FetchLatestVersion(repository: ref.watch(versionRepositoryProvider)),
);

final fetchLocalProvider = Provider(
  (ref) => FetchLocalVersion(repository: ref.watch(versionRepositoryProvider)),
);

//! repository
final versionRepositoryProvider = Provider<IVersionRepository>(
  (ref) => VersionRepository(
    local: ref.watch(versionLocalServiceProvider),
    remote: ref.watch(versionRemoteServiceProvider),
  ),
);

//! datasource
final versionRemoteServiceProvider = Provider<VersionRemoteService>(
  (ref) => VersionDioRemoteService(httpClient: ref.watch(dioProvider)),
);

final versionLocalServiceProvider = Provider<VersionLocalService>(
  (ref) => VersionPackageInfoLocalService(
      packageInfo: ref.watch(packageInfoProvider)),
);

//! external
final packageInfoProvider = Provider(
  (ref) => PackageInfo.fromPlatform(),
);
