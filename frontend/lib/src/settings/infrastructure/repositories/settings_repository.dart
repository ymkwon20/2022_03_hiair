import 'package:dartz/dartz.dart';

import 'package:frontend/src/core/failures/failure.dart';
import 'package:frontend/src/settings/domain/entities/settings_info.dart';
import 'package:frontend/src/settings/domain/repositories/i_settings_repository.dart';

class SettingsRepository implements ISettingsRepository {
  const SettingsRepository();

  @override
  Future<Either<Failure, SettingsInfo>> loadSettings() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateTheme(String theme) {
    throw UnimplementedError();
  }
}
