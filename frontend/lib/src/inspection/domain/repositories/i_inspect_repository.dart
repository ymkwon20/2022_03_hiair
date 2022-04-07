import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/core/image/domain/entities/image_origin.dart';

abstract class IInspectRepository {
  Future<Either<Failure, String>> pickImage(ImageOrigin origin);
  Future<Either<Failure, String>> pickImages(ImageOrigin origin);
}
