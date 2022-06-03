import 'package:dartz/dartz.dart';
import 'package:frontend/src/checklist/domain/entities/check_image.dart';
import 'package:frontend/src/checklist/domain/repositories/i_checklist_repository.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';

class FetchCheckimagelist
    implements Usecase<List<CheckImage>, Map<String, dynamic>> {
  final IChecklistRepository _repository;

  const FetchCheckimagelist({
    required IChecklistRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, List<CheckImage>>> call(
      [Map<String, dynamic>? params]) async {
    return _repository.fetchCheckimagelist(params!);
  }
}
