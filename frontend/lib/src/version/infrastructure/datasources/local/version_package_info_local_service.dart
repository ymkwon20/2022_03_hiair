import 'package:package_info_plus/package_info_plus.dart';

import 'package:frontend/src/version/infrastructure/datasources/local/version_local_service.dart';

class VersionPackageInfoLocalService implements VersionLocalService {
  const VersionPackageInfoLocalService({
    required Future<PackageInfo> packageInfo,
  }) : _packageInfo = packageInfo;

  final Future<PackageInfo> _packageInfo;

  @override
  Future<String> fetchLocalVersion() async {
    return (await _packageInfo).version;
  }
}
