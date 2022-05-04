import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';

import 'package:frontend/src/qm/domain/entities/qm_item.dart';
import 'package:frontend/src/qm/domain/repositories/i_qm_repository.dart';

class FetchQmItems {
  final IQmRepository _repository;

  const FetchQmItems({
    required IQmRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, List<QmItem>>> call(
      Map<String, dynamic> params) async {
    return _repository.fetchQmItems(params);
  }
}
