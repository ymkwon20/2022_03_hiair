import 'package:dartz/dartz.dart';

import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/core/usecases/usecase.dart';
import 'package:frontend/src/cutting/domain/repositories/i_cutting_repository.dart';

class SaveCuttingCheck implements Usecase<Unit, Map<String, dynamic>> {
  final ICuttingRepository _repository;

  const SaveCuttingCheck({
    required ICuttingRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, Unit>> call([Map<String, dynamic>? params]) {
    return _repository.saveCuttingCheck(params!);
  }
}
