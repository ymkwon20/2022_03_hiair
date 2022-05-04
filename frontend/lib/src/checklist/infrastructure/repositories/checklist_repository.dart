import 'package:dartz/dartz.dart';

import 'package:frontend/src/checklist/domain/entities/checklist.dart';
import 'package:frontend/src/checklist/domain/repositories/i_checklist_repository.dart';
import 'package:frontend/src/checklist/infrastructure/datasources/checklist_service.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';

class ChecklistRepository implements IChecklistRepository {
  final ChecklistService _remote;

  const ChecklistRepository({
    required ChecklistService remote,
  }) : _remote = remote;

  @override
  Future<Either<Failure, List<Checklist>>> fetchChecklist(
      Map<String, dynamic> params) async {
    try {
      final remoteFetch = await _remote.fetchChecklist(params);
      return right(remoteFetch);
    } on NoConnectionException catch (e) {
      return left(Failure.noConnection(e.message));
    } on InvalidServerResponseException catch (e) {
      return left(Failure.server(e.message));
    } on ServerConnectionException catch (e) {
      return left(Failure.server(e.message));
    }
  }
}
