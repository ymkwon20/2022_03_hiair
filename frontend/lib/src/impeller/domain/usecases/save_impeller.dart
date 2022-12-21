import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';
import 'package:frontend/src/impeller/domain/repositories/i_impeller_repository.dart';

class SaveImpeller implements Usecase<Unit, Map<String, dynamic>> {
  final IImpellerRepository _repository;

  const SaveImpeller({
    required IImpellerRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, Unit>> call([Map<String, dynamic>? params]) async {
    return await _repository.saveImpeller(params!);
  }
}
