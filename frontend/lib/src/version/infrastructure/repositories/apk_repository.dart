import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/errors/exceptions.dart';

import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/version/domain/repositories/i_apk_repository.dart';
import 'package:frontend/src/version/infrastructure/datasources/apk_service.dart';

class ApkRepository implements IApkRepository {
  const ApkRepository({
    required ApkService remote,
  }) : _remote = remote;

  final ApkService _remote;

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
