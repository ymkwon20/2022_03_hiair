import 'package:dartz/dartz.dart';

import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';
import 'package:frontend/src/safety/domain/repositories/i_safety_repository.dart';

class SaveSafetyRepairInfo implements Usecase<Unit, Map<String, dynamic>> {
  const SaveSafetyRepairInfo({
    required ISafetyRepository repository,
  }) : _repository = repository;

  final ISafetyRepository _repository;

  @override
  Future<Either<Failure, Unit>> call([Map<String, dynamic>? params]) async {
    return await _repository.saveSafetyRepairInfo(params!);
  }
}
