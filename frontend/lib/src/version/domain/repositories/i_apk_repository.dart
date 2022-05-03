import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/errors/failure.dart';

abstract class IApkRepository {
  Future<Either<Failure, String>> fetchLatestApkVersion();
}
