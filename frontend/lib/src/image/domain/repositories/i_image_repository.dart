import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/image/domain/entities/image_source.dart';

abstract class IImageRepository {
  Future<Either<Failure, String?>> fetchImage(ImageSource source);
  Future<Either<Failure, List<String>>> fetchImages(ImageSource source);
  Future<Either<Failure, Unit>> saveImages(List<String> images);
}
