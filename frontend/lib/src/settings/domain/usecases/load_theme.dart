import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';
import 'package:frontend/src/settings/domain/entities/settings_info.dart';
import 'package:frontend/src/settings/domain/repositories/i_settings_repository.dart';

class LoadThemeUsecase implements Usecase<SettingsInfo, Unit> {
  final ISettingsRepository _repository;

  const LoadThemeUsecase({
    required ISettingsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, SettingsInfo>> call([Unit? params]) async {
    return await _repository.loadTheme();
  }
}
