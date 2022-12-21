import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';
import 'package:frontend/src/impeller/domain/repositories/i_impeller_repository.dart';

class SaveImpellerList implements Usecase<Unit, List<Map<String, dynamic>>> {
  final IImpellerRepository _repository;

  const SaveImpellerList({
    required IImpellerRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, Unit>> call(
      [List<Map<String, dynamic>>? params]) async {
    return _repository.saveImpellerList(params!);
  }
}
