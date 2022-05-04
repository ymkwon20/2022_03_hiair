import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';

import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_check.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_check_detail.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_serial.dart';
import 'package:frontend/src/cutting/domain/repositories/i_cutting_repository.dart';
import 'package:frontend/src/cutting/infrastructure/datasources/cutting_service.dart';

class CuttingRepository implements ICuttingRepository {
  final CuttingService _remoteService;

  const CuttingRepository({
    required CuttingService remoteService,
  }) : _remoteService = remoteService;

  @override
  Future<Either<Failure, List<CuttingSerial>>> getCuttings() async {
    try {
      final remoteFetch = await _remoteService.fetchCuttings();
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
  Future<Either<Failure, List<CuttingCheck>>> getCuttingCheck(
      CuttingSerial serial) async {
    try {
      final remoteFetch = await _remoteService.fetchCuttingChecks(serial);
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
  Future<Either<Failure, List<CuttingCheckDetail>>> getCuttingRequest(
      CuttingSerial serial) async {
    try {
      final remoteFetch = await _remoteService.fetchCuttingRequests(serial);
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
  Future<Either<Failure, Unit>> saveCuttingCheck(
      Map<String, dynamic> params) async {
    try {
      await _remoteService.saveCuttingCheck(params);
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
