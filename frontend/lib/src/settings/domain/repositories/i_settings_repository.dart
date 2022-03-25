import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/settings/domain/entities/settings_info.dart';

abstract class ISettingsRepository {
  Future<Either<Failure, SettingsInfo>> loadTheme();
  Future<Either<Failure, Unit>> updateTheme(String theme);
}
