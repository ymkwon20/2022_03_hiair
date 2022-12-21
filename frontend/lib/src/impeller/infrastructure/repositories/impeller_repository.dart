import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/impeller/domain/entities/impeller_list.dart';
import 'package:frontend/src/impeller/domain/repositories/i_impeller_repository.dart';
import 'package:frontend/src/impeller/infrastructure/datasources/impeller_service.dart';

class ImpellerRepository implements IImpellerRepository {
  final ImpellerService _remoteService;

  const ImpellerRepository({
    required ImpellerService remote,
  }) : _remoteService = remote;

  @override
  Future<Either<Failure, ImpellerList>> fetchImpellerList(
      Map<String, dynamic> params) async {
    try {
      final remoteFetch = await _remoteService.fetchImpellerList(params);
      return right(remoteFetch.toDomain());
    } on NoConnectionException catch (e) {
      return left(Failure.noConnection(e.message));
    } on InvalidServerResponseException catch (e) {
      return left(Failure.server(e.message));
    } on ServerConnectionException catch (e) {
      return left(Failure.server(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveImpeller(
      Map<String, dynamic> params) async {
    try {
      await _remoteService.saveImpeller(params);
      return right(unit);
    } on NoConnectionException catch (e) {
      return left(Failure.noConnection(e.message));
    } on InvalidServerResponseException catch (e) {
      return left(Failure.server(e.message));
    } on ServerConnectionException catch (e) {
      return left(Failure.server(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveImpellerList(
      List<Map<String, dynamic>> params) async {
    try {
      await _remoteService.saveImpellerList(params);
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
