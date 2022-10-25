import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';

/// Implementations are seperated for architectural reasons.
/// To find implementation details,
/// go to lib/src/version/infrastructure/repositories/version_repository.dart
/// for implementation
abstract class IVersionRepository {
  Future<Either<Failure, String>> fetchLatestVersion();
  Future<Either<Failure, String>> fetchLatestUrl();
  Future<String> fetchLocalVersion();
}
