import 'package:dartz/dartz.dart';

import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';
import 'package:frontend/src/safety/domain/repositories/i_safety_repository.dart';

class SaveSafetyChecks implements Usecase<Unit, List<Map<String, dynamic>>> {
  const SaveSafetyChecks({
    required ISafetyRepository repository,
  }) : _repository = repository;

  final ISafetyRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(
      [List<Map<String, dynamic>>? params]) async {
    return _repository.saveSafetyChecks(params!);
  }
}
