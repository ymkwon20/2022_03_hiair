import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/errors/exceptions.dart';

import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/fct/domain/entities/fct.dart';
import 'package:frontend/src/fct/domain/repositories/i_fct_repository.dart';
import 'package:frontend/src/fct/infrastructure/datasources/i_fct_service.dart';

class FctRepository implements IFctRepository {
  final IFctService _remote;

  const FctRepository({
    required IFctService remote,
  }) : _remote = remote;

  @override
  Future<Either<Failure, List<String>>> getFctSerials() async {
    try {
      final remoteFetch = await _remote.getFctSerials();
      return right(remoteFetch);
    } on NoConnectionException catch (e) {
      return left(Failure.noConnection(e.message));
    } on InvalidServerResponseException catch (e) {
      return left(Failure.server(e.message));
    } on ServerConnectionException catch (e) {
      return left(Failure.server(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Fct>>> getFctItems(String serial) async {
    try {
      final remoteFetch = await _remote.getFctItems(serial);
      return right(remoteFetch);
    } on NoConnectionException catch (e) {
      return left(Failure.noConnection(e.message));
    } on InvalidServerResponseException catch (e) {
      return left(Failure.server(e.message));
    } on ServerConnectionException catch (e) {
      return left(Failure.server(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveFctItems(
      List<Map<String, dynamic>> params) async {
    try {
      await _remote.saveFctItem(params);
      return right(unit);
    } on NoConnectionException catch (e) {
      return left(Failure.noConnection(e.message));
    } on InvalidServerResponseException catch (e) {
      return left(Failure.server(e.message));
    } on ServerConnectionException catch (e) {
      return left(Failure.server(e.message));
    }
  }
}
