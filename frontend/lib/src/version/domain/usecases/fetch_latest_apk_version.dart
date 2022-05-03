import 'package:dartz/dartz.dart';

import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/core/usecases/usecase.dart';
import 'package:frontend/src/version/domain/repositories/i_apk_repository.dart';

class FetchLatestApkVersion implements Usecase<String, void> {
  final IApkRepository _repository;

  const FetchLatestApkVersion({
    required IApkRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, String>> call([void params]) async {
    return _repository.fetchLatestApkVersion();
  }
}
