import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/errors/exceptions.dart';

import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_check.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_request.dart';
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
    } on NoConnectionException {
      return left(const Failure.noConnection());
    } on InvalidServerResponseException {
      return left(const Failure.server("정보를 받는 과정에서 문제가 발생하였습니다."));
    } on ServerConnectionException {
      return left(const Failure.server("서버를 찾을 수 없습니다."));
    }
  }

  @override
  Future<Either<Failure, List<CuttingCheck>>> getCuttingCheck(
      CuttingSerial serial) async {
    try {
      final remoteFetch = await _remoteService.fetchCuttingChecks(serial);
      return right(remoteFetch);
    } on NoConnectionException {
      return left(const Failure.noConnection());
    } on InvalidServerResponseException {
      return left(const Failure.server("정보를 받는 과정에서 문제가 발생하였습니다."));
    } on ServerConnectionException {
      return left(const Failure.server("서버를 찾을 수 없습니다."));
    }
  }

  @override
  Future<Either<Failure, List<CuttingRequest>>> getCuttingRequest(
      CuttingSerial serial) async {
    try {
      final remoteFetch = await _remoteService.fetchCuttingRequests(serial);
      return right(remoteFetch);
    } on NoConnectionException {
      return left(const Failure.noConnection());
    } on InvalidServerResponseException {
      return left(const Failure.server("정보를 받는 과정에서 문제가 발생하였습니다."));
    } on ServerConnectionException {
      return left(const Failure.server("서버를 찾을 수 없습니다."));
    }
  }
}
