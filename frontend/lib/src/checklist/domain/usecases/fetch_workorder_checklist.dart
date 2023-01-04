import 'package:dartz/dartz.dart';
import 'package:frontend/src/checklist/domain/entities/check_item.dart';
import 'package:frontend/src/checklist/domain/repositories/i_checklist_repository.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';

class FetchWorkOrderChecklist
    implements Usecase<List<CheckItem>, Map<String, dynamic>> {
  FetchWorkOrderChecklist({
    required IChecklistRepository repository,
  }) : _repository = repository;

  final IChecklistRepository _repository;

  @override
  Future<Either<Failure, List<CheckItem>>> call(
      [Map<String, dynamic>? params]) async {
    return _repository.fetchCutChecklist(params!);
  }
}
