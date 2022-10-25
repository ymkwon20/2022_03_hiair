import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/settings/domain/entities/settings_info.dart';

/// Implementations are seperated for architectural reasons.
/// To find implementation details,
/// go to lib/src/settings/infrastructure/repositories/settings_repository.dart
/// for implementation
abstract class ISettingsRepository {
  Future<Either<Failure, SettingsInfo>> loadTheme();
  Future<Either<Failure, Unit>> updateTheme(String theme);
}
