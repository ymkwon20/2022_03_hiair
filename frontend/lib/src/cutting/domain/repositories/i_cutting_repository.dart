import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_check.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_request.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_serial.dart';

/// Cutting Feature 관련 repository
abstract class ICuttingRepository {
  /// Cutting LOT 목록
  Future<Either<Failure, List<CuttingSerial>>> getCuttings();

  /// Cutting CheckSheet
  Future<Either<Failure, List<CuttingCheck>>> getCuttingCheck(
      CuttingSerial serial);

  /// Cutting Request 정보
  Future<Either<Failure, List<CuttingRequest>>> getCuttingRequest(
      CuttingSerial serial);

  /// Cutting Check 저장
  Future<Either<Failure, Unit>> saveCuttingCheck(CuttingCheck check);
}
