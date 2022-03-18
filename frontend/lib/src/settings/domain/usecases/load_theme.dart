import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/failures/failure.dart';
import 'package:frontend/src/settings/domain/entities/settings_info.dart';
import 'package:frontend/src/settings/infrastructure/repositories/settings_repository.dart';

class LoadThemeUsecase {
  final SettingsRepository _repository;

  const LoadThemeUsecase({
    required SettingsRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, SettingsInfo>> execute() async {
    return await _repository.loadSettings();
  }
}
