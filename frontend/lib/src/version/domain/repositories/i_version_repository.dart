import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';

abstract class IVersionRepository {
  Future<Either<Failure, String>> fetchLatestApkVersion();
}
