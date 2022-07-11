import 'package:dartz/dartz.dart';

import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/image/domain/entities/image_source.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/image/domain/repositories/i_image_repository.dart';
import 'package:frontend/src/image/infrastructure/service/local/i_image_local_service.dart';
import 'package:frontend/src/image/infrastructure/service/remote/i_image_remote_service.dart';

class ImageRepository implements IImageRepository {
  final IImageLocalService _local;
  final IImageRemoteService _remote;

  const ImageRepository({
    required IImageLocalService local,
    required IImageRemoteService remote,
  })  : _local = local,
        _remote = remote;

  // ! deprecated
  // - 이미지 여러장 pick 하기 위해 fetchImages로 변경
  @override
  Future<Either<Failure, String>> fetchImage(ImageSource source) async {
    try {
      switch (source) {
        case ImageSource.gallery:
          final results = await _local.pickImage();
          return right(results);
        case ImageSource.camera:
          final results = await _local.takeOnePicture();
          return right(results);
      }
    } on UnsupportedPlatformException {
      return left(const Failure.internal("지원하지 않는 플랫폼"));
    }
  }

  @override
  Future<Either<Failure, List<String>>> fetchMultipleImages(
      ImageSource source) async {
    try {
      switch (source) {
        case ImageSource.gallery:
          final results = await _local.pickMultiImages();
          return right(results);
        case ImageSource.camera:
          final results = await _local.takeOnePicture();
          return right([results]);
      }
    } on NotSelectedException {
      return left(const Failure.internal("선택되지 않음"));
    } on UnsupportedPlatformException {
      return left(const Failure.internal("지원하지 않는 플랫폼"));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveImages(List<String> images) async {
    try {
      await _remote.saveImages(images);
      return right(unit);
    } on ServerConnectionException catch (e) {
      return left(Failure.internal(e.message));
    } on InvalidServerResponseException catch (e) {
      return left(Failure.server(e.message));
    } on NoConnectionException catch (e) {
      return left(Failure.noConnection(e.message));
    }
  }
}
