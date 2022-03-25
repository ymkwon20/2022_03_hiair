import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/core/usecases/usecase.dart';
import 'package:frontend/src/settings/domain/repositories/i_settings_repository.dart';

class UpdateThemeUsecase implements Usecase<Unit, String> {
  final ISettingsRepository _repository;

  const UpdateThemeUsecase({required ISettingsRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, Unit>> call([String? params]) async {
    return await _repository.updateTheme(params!);
  }
}
