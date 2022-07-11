import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';
import 'package:frontend/src/image/domain/entities/image_source.dart';
import 'package:frontend/src/image/domain/repositories/i_image_repository.dart';

class FetchMultipleImages implements Usecase<List<String>, ImageSource> {
  const FetchMultipleImages({
    required IImageRepository repository,
  }) : _repository = repository;

  final IImageRepository _repository;

  @override
  Future<Either<Failure, List<String>>> call([ImageSource? params]) async {
    return _repository.fetchMultipleImages(params!);
  }
}
