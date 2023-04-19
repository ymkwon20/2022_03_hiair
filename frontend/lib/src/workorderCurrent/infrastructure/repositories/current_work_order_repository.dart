import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/workorderCurrent/domain/entities/current_work_order_list.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/src/workorderCurrent/domain/repositories/i_current_work_order_repository.dart';
import 'package:frontend/src/workorderCurrent/infrastructure/datasources/current_work_order_service.dart';

class CurrentWorkOrderRepository implements ICurrentWorkOrderRepository {
  final CurrentWorkOrderService _remoteService;

  const CurrentWorkOrderRepository({
    required CurrentWorkOrderService remote,
  }) : _remoteService = remote;

  @override
  Future<Either<Failure, CurrentWorkOrderList>> fetchCurrentWorkOrderList(
      Map<String, dynamic> params) async {
    try {
      final remoteFetch =
          await _remoteService.fetchCurrentWorkOrderList(params);
      return right(remoteFetch.toDomain());
    } on NoConnectionException catch (e) {
      return left(Failure.noConnection(e.message));
    } on InvalidServerResponseException catch (e) {
      return left(Failure.server(e.message));
    } on ServerConnectionException catch (e) {
      return left(Failure.server(e.message));
    }
  }
}
