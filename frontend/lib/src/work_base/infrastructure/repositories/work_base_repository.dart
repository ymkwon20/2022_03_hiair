import 'package:dartz/dartz.dart';

import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/work_base/domain/entities/work_base_info.dart';
import 'package:frontend/src/work_base/domain/repositories/i_work_base_repository.dart';
import 'package:frontend/src/work_base/infrastructure/datasources/work_base_service.dart';

class WorkBaseRepository implements IWorkBaseRepository {
  final WorkBaseService _remote;

  const WorkBaseRepository({
    required WorkBaseService remote,
  }) : _remote = remote;

  @override
  Future<Either<Failure, List<WorkBaseInfo>>> fetchWorkBases(
      Map<String, dynamic> params) async {
    try {
      final results = await _remote.fetchWorkBases(params);
      return right(results);
    } on NoConnectionException catch (e) {
      return left(Failure.noConnection(e.message));
    } on InvalidServerResponseException catch (e) {
      return left(Failure.server(e.message));
    } on ServerConnectionException catch (e) {
      return left(Failure.server(e.message));
    }
  }
}
