import 'package:dartz/dartz.dart';

import 'package:frontend/src/checklist/domain/repositories/i_checklist_repository.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';

class FetchAndSaveChecklist implements Usecase<Unit, Map<String, dynamic>> {
  const FetchAndSaveChecklist({
    required IChecklistRepository repository,
  }) : _repository = repository;

  final IChecklistRepository _repository;

  @override
  Future<Either<Failure, Unit>> call([Map<String, dynamic>? params]) async {
    return await _repository.fetchAndSaveChecklist(params!);
  }
}
