import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/failures/failure.dart';
import 'package:frontend/src/settings/domain/entities/settings_info.dart';

abstract class ISettingsRepository {
  Future<Either<Failure, SettingsInfo>> loadSettings();
  Future<Either<Failure, Unit>> updateTheme(String theme);
}
