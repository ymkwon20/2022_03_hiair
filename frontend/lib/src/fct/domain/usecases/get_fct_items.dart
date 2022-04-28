import 'package:frontend/src/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/usecases/usecase.dart';
import 'package:frontend/src/fct/domain/entities/fct.dart';
import 'package:frontend/src/fct/domain/repositories/i_fct_repository.dart';

class GetFctItems implements Usecase<List<Fct>, String> {
  final IFctRepository _repository;

  const GetFctItems({required IFctRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, List<Fct>>> call([String? params]) async {
    return _repository.getFctItems(params!);
  }
}
