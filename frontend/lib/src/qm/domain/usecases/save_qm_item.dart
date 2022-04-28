import 'package:dartz/dartz.dart';

import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/core/usecases/usecase.dart';
import 'package:frontend/src/qm/domain/repositories/i_qm_repository.dart';

class SaveQmItem implements Usecase<Unit, Map<String, dynamic>> {
  final IQmRepository _repository;

  const SaveQmItem({
    required IQmRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, Unit>> call([Map<String, dynamic>? params]) async {
    return await _repository.saveQmItem(params!);
  }
}
