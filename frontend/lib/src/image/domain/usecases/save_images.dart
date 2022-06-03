import 'package:dartz/dartz.dart';

import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';
import 'package:frontend/src/image/domain/repositories/i_image_repository.dart';

class SaveImages implements Usecase<Unit, List<String>> {
  final IImageRepository _repository;

  const SaveImages({
    required IImageRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, Unit>> call([List<String>? params]) {
    return _repository.saveImages(params!);
  }
}
