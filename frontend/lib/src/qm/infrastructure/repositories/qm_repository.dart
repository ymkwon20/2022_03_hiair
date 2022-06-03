import 'package:dartz/dartz.dart';

import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/qm/domain/entities/qm_menu.dart';
import 'package:frontend/src/qm/domain/repositories/i_qm_repository.dart';
import 'package:frontend/src/qm/infrastructure/datasources/qm_service.dart';

class QmRepository implements IQmRepository {
  final QmService _remote;
  const QmRepository({
    required QmService remote,
  }) : _remote = remote;

  @override
  Future<Either<Failure, List<QmMenu>>> fetchQmMenulist(
      Map<String, dynamic> params) async {
    try {
      final remoteFetch = await _remote.fetchQmMenulist(params);
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
