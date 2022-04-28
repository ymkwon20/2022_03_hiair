import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/core/image/domain/entities/image_origin.dart';
import 'package:frontend/src/qm/domain/entities/qm_item.dart';

abstract class IQmRepository {
  Future<Either<Failure, String>> pickImage(ImageOrigin origin);
  Future<Either<Failure, String>> pickImages(ImageOrigin origin);
  Future<Either<Failure, List<QmItem>>> fetchQmItems(
      Map<String, dynamic> params);
  Future<Either<Failure, Unit>> saveQmItem(Map<String, dynamic> params);
  Future<Either<Failure, Unit>> saveQmList(List<Map<String, dynamic>> params);
}
