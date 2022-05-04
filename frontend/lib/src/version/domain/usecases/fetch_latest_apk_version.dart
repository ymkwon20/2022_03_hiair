import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';

import 'package:frontend/src/core/domain/usecases/usecase.dart';
import 'package:frontend/src/version/domain/repositories/i_version_repository.dart';

class FetchLatestApkVersion implements Usecase<String, void> {
  final IVersionRepository _repository;

  const FetchLatestApkVersion({
    required IVersionRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, String>> call([void params]) async {
    return _repository.fetchLatestApkVersion();
  }
}
