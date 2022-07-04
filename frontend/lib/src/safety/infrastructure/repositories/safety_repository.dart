import 'package:dartz/dartz.dart';

import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/safety/domain/entities/safety_check.dart';
import 'package:frontend/src/safety/domain/entities/safety_info.dart';
import 'package:frontend/src/safety/domain/repositories/i_safety_repository.dart';
import 'package:frontend/src/safety/infrastructure/datasources/safety_service.dart';

class SafetyRepository implements ISafetyRepository {
  const SafetyRepository({
    required SafetyService remote,
  }) : _remote = remote;

  final SafetyService _remote;

  @override
  Future<Either<Failure, List<SafetyInfo>>> fetchSafetyInfo(
      Map<String, dynamic> params) async {
    try {
      final remoteFetch = await _remote.fetchSafetyInfos(params);
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
  Future<Either<Failure, List<SafetyCheck>>> fetchSafetyChecks(
      Map<String, dynamic> params) async {
    try {
      final remoteFetch = await _remote.fetchSafetyChecks(params);
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
  Future<Either<Failure, Unit>> saveSafetyChecks(
      List<Map<String, dynamic>> params) async {
    try {
      await _remote.saveSafetyChecks(params);
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
  Future<Either<Failure, Unit>> saveSafetyRepairInfo(
      Map<String, dynamic> params) async {
    try {
      await _remote.saveSafetyRepairInfo(params);
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
