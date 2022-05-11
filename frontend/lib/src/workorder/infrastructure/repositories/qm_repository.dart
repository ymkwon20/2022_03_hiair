import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/image/domain/entities/image_origin.dart';
import 'package:frontend/src/workorder/domain/entities/work_order_list.dart';
import 'package:frontend/src/workorder/domain/repositories/i_work_order_repository.dart';
import 'package:frontend/src/workorder/infrastructure/datasources/work_order_service.dart';

class WorkOrderRepository implements IWorkOrderRepository {
  final WorkOrderService _remoteService;

  const WorkOrderRepository({
    required WorkOrderService remote,
  }) : _remoteService = remote;

  @override
  Future<Either<Failure, WorkOrderList>> fetchWorkOrderList(
      Map<String, dynamic> params) async {
    try {
      final remoteFetch = await _remoteService.fetchWorkOrderList(params);
      return right(remoteFetch.toDomain());
    } on NoConnectionException catch (e) {
      return left(Failure.noConnection(e.message));
    } on InvalidServerResponseException catch (e) {
      return left(Failure.server(e.message));
    } on ServerConnectionException catch (e) {
      return left(Failure.server(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveWorkOrder(
      Map<String, dynamic> params) async {
    try {
      await _remoteService.saveWorkOrder(params);
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
  Future<Either<Failure, Unit>> saveWorkOrderList(
      List<Map<String, dynamic>> params) async {
    try {
      await _remoteService.saveWorkOrderList(params);
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
