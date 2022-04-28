import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/errors/exceptions.dart';

import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/core/image/domain/entities/image_origin.dart';
import 'package:frontend/src/qm/domain/entities/qm_item.dart';
import 'package:frontend/src/qm/domain/repositories/i_qm_repository.dart';
import 'package:frontend/src/qm/infrastructure/datasources/qm_service.dart';

class QmRepository implements IQmRepository {
  final QmService _remoteService;
  QmRepository({
    required QmService remote,
  }) : _remoteService = remote;

  @override
  Future<Either<Failure, List<QmItem>>> fetchQmItems(
      Map<String, dynamic> params) async {
    try {
      final remoteFetch = await _remoteService.fetchQmItems(params);
      return right(remoteFetch);
    } on NoConnectionException catch (e) {
      return left(Failure.noConnection(e.message));
    } on InvalidServerResponseException catch (e) {
      return left(Failure.server(e.message));
    } on ServerConnectionException catch (e) {
      return left(Failure.server(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveQmItem(Map<String, dynamic> params) async {
    try {
      await _remoteService.saveQmItem(params);
      return right(unit);
    } on NoConnectionException catch (e) {
      return left(Failure.noConnection(e.message));
    } on InvalidServerResponseException catch (e) {
      return left(Failure.server(e.message));
    } on ServerConnectionException catch (e) {
      return left(Failure.server(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveQmList(
      List<Map<String, dynamic>> params) async {
    try {
      await _remoteService.saveQmList(params);
      return right(unit);
    } on NoConnectionException catch (e) {
      return left(Failure.noConnection(e.message));
    } on InvalidServerResponseException catch (e) {
      return left(Failure.server(e.message));
    } on ServerConnectionException catch (e) {
      return left(Failure.server(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> pickImage(ImageOrigin origin) {
    // TODO: implement pickImage
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> pickImages(ImageOrigin origin) {
    // TODO: implement pickImages
    throw UnimplementedError();
  }
}
