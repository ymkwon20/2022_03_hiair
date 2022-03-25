import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/errors/exceptions.dart';
import 'package:frontend/src/core/errors/failure.dart';

import 'package:frontend/src/settings/domain/entities/settings_info.dart';
import 'package:frontend/src/settings/domain/repositories/i_settings_repository.dart';
import 'package:frontend/src/settings/infrastructure/datasources/settings_service.dart';

class SettingsRepository implements ISettingsRepository {
  final SettingsService _service;
  const SettingsRepository({
    required SettingsService service,
  }) : _service = service;

  @override
  Future<Either<Failure, SettingsInfo>> loadTheme() async {
    try {
      final settings = await _service.settings;
      return Right(settings.toDomain());
    } on InternalException {
      return const Left(Failure.internal());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateTheme(String theme) async {
    try {
      await _service.updateThemeMode(theme);
      return const Right(unit);
    } on InternalException {
      return const Left(Failure.internal());
    }
  }
}
