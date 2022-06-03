import 'package:dartz/dartz.dart';

import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';
import 'package:frontend/src/work_base/domain/entities/work_base_info.dart';
import 'package:frontend/src/work_base/domain/repositories/i_work_base_repository.dart';

class FetchWorkBases
    implements Usecase<List<WorkBaseInfo>, Map<String, dynamic>> {
  final IWorkBaseRepository _repository;

  const FetchWorkBases({
    required IWorkBaseRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, List<WorkBaseInfo>>> call(
      [Map<String, dynamic>? params]) async {
    return await _repository.fetchWorkBases(params!);
  }
}
