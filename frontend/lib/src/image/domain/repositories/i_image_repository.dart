import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/image/domain/entities/image_source.dart';

/// Implementations are seperated for architectural reasons.
/// To find implementation details,
/// go to lib/src/image/infrastructure/repositories/image_repository.dart
/// for implementation
abstract class IImageRepository {
  Future<Either<Failure, String>> fetchImage(ImageSource source);
  Future<Either<Failure, List<String>>> fetchMultipleImages(ImageSource source);
  Future<Either<Failure, Unit>> saveImages(List<String> images);
}
