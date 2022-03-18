import 'package:dartz/dartz.dart';

import 'package:frontend/src/core/failures/failure.dart';
import 'package:frontend/src/settings/domain/entities/settings_info.dart';
import 'package:frontend/src/settings/domain/repositories/i_settings_repository.dart';
import 'package:frontend/src/settings/infrastructure/datasources/settings_service.dart';

class SettingsRepository implements ISettingsRepository {
  final SettingsService _service;

  const SettingsRepository({
    required SettingsService service,
  }) : _service = service;

  @override
  Future<Either<Failure, SettingsInfo>> loadSettings() {
    // TODO: implement loadSettings
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateTheme(String theme) {
    // TODO: implement updateTheme
    throw UnimplementedError();
  }
}
