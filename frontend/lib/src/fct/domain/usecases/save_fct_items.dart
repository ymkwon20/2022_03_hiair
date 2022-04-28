import 'package:dartz/dartz.dart';

import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/core/usecases/usecase.dart';
import 'package:frontend/src/fct/domain/repositories/i_fct_repository.dart';

class SaveFctItems implements Usecase<Unit, List<Map<String, dynamic>>> {
  final IFctRepository _repository;
  const SaveFctItems({
    required IFctRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, Unit>> call(
      [List<Map<String, dynamic>>? params]) async {
    return _repository.saveFctItems(params!);
  }
}
