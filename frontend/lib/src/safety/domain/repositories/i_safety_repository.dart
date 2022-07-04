import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/safety/domain/entities/safety_check.dart';
import 'package:frontend/src/safety/domain/entities/safety_info.dart';

abstract class ISafetyRepository {
  Future<Either<Failure, List<SafetyInfo>>> fetchSafetyInfo(
      Map<String, dynamic> params);
  Future<Either<Failure, List<SafetyCheck>>> fetchSafetyChecks(
      Map<String, dynamic> params);
  Future<Either<Failure, Unit>> saveSafetyChecks(
      List<Map<String, dynamic>> params);
  Future<Either<Failure, Unit>> saveSafetyRepairInfo(
      Map<String, dynamic> params);
}
