import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';

import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/version/domain/repositories/i_version_repository.dart';
import 'package:frontend/src/version/infrastructure/datasources/version_service.dart';

class VersionRepository implements IVersionRepository {
  const VersionRepository({
    required VersionService remote,
  }) : _remote = remote;

  final VersionService _remote;

  @override
  Future<Either<Failure, String>> fetchLatestApkVersion() async {
    try {
      final results = await _remote.fetchLatestApkVersion();
      return right(results);
    } on NoConnectionException catch (e) {
      return left(Failure.noConnection(e.message));
    } on InvalidServerResponseException catch (e) {
      return left(Failure.server(e.message));
    } on ServerConnectionException catch (e) {
      return left(Failure.server(e.message));
    }
  }
}
