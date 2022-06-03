import 'package:dartz/dartz.dart';

import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';
import 'package:frontend/src/qm/domain/entities/qm_menu.dart';
import 'package:frontend/src/qm/domain/repositories/i_qm_repository.dart';

class FetchQmMenulist implements Usecase<List<QmMenu>, Map<String, dynamic>> {
  final IQmRepository _repository;

  const FetchQmMenulist({
    required IQmRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, List<QmMenu>>> call(
      [Map<String, dynamic>? params]) async {
    return _repository.fetchQmMenulist(params!);
  }
}
