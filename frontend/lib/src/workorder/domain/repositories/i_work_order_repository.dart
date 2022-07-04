import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/workorder/domain/entities/qm_work_order_list.dart';
import 'package:frontend/src/workorder/domain/entities/work_order_list.dart';

abstract class IWorkOrderRepository {
  Future<Either<Failure, WorkOrderList>> fetchWorkOrderList(
      Map<String, dynamic> params);
  Future<Either<Failure, Unit>> saveWorkOrder(Map<String, dynamic> params);
  Future<Either<Failure, Unit>> saveWorkOrderList(
      List<Map<String, dynamic>> params);
  Future<Either<Failure, QmWorkOrderList>> fetchQmWorkOrderList();
  Future<Either<Failure, Unit>> saveQmWorkOrder(Map<String, dynamic> params);
}
