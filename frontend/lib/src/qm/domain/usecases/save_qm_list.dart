import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';

import 'package:frontend/src/qm/domain/repositories/i_qm_repository.dart';

class SaveQmList implements Usecase<Unit, List<Map<String, dynamic>>> {
  final IQmRepository _repository;

  const SaveQmList({
    required IQmRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, Unit>> call(
      [List<Map<String, dynamic>>? params]) async {
    return _repository.saveQmList(params!);
  }
}
