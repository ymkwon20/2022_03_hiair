import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';
import 'package:frontend/src/fct/domain/repositories/i_fct_repository.dart';

class GetFctSerials implements Usecase<List<String>, void> {
  final IFctRepository _repository;

  const GetFctSerials({
    required IFctRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, List<String>>> call([void params]) async {
    return _repository.getFctSerials();
  }
}
