import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';

import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/version/domain/repositories/i_version_repository.dart';
import 'package:frontend/src/version/infrastructure/datasources/local/version_local_service.dart';
import 'package:frontend/src/version/infrastructure/datasources/remote/version_remove_service.dart';

class VersionRepository implements IVersionRepository {
  const VersionRepository({
    required VersionLocalService local,
    required VersionRemoteService remote,
  })  : _remote = remote,
        _local = local;

  final VersionRemoteService _remote;
  final VersionLocalService _local;

  @override
  Future<Either<Failure, String>> fetchLatestVersion() async {
    try {
      final results = await _remote.fetchLatestVersion();
      return right(results);
    } on NoConnectionException catch (e) {
      return left(Failure.noConnection(e.message));
    } on InvalidServerResponseException catch (e) {
      return left(Failure.server(e.message));
    } on ServerConnectionException catch (e) {
      return left(Failure.server(e.message));
    }
  }

  @override
  Future<String> fetchLocalVersion() async {
    return await _local.fetchLocalVersion();
  }

  @override
  Future<Either<Failure, String>> fetchLatestUrl() async {
    try {
      final results = await _remote.fetchLatestUrl();
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
