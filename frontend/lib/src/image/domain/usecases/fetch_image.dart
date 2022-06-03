import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';
import 'package:frontend/src/image/domain/entities/image_source.dart';
import 'package:frontend/src/image/domain/repositories/i_image_repository.dart';

class FetchImage implements Usecase<String?, ImageSource> {
  const FetchImage({
    required IImageRepository repository,
  }) : _repository = repository;

  final IImageRepository _repository;

  @override
  Future<Either<Failure, String?>> call([ImageSource? params]) async {
    return _repository.fetchImage(params!);
  }
}
