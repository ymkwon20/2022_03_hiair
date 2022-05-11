import 'package:dartz/dartz.dart';
import 'package:frontend/src/checklist/domain/repositories/i_checklist_repository.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';

class SaveChecklist implements Usecase<Unit, List<Map<String, dynamic>>> {
  const SaveChecklist({
    required IChecklistRepository repository,
  }) : _repository = repository;

  final IChecklistRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(
      [List<Map<String, dynamic>>? params]) async {
    return _repository.saveCheckitem(params!);
  }
}
