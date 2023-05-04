import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/workorder/domain/entities/qm_work_order_list.dart';
import 'package:frontend/src/workorder/domain/entities/work_order_list.dart';

/// Implementations are seperated for architectural reasons.
/// To find implementation details,
/// go to lib/src/workorder/infrastructure/repositories/work_order_repository.dart
/// for implementation
abstract class IWorkOrderRepository {
  Future<Either<Failure, WorkOrderList>> fetchWorkOrderList(
      Map<String, dynamic> params);
  Future<Either<Failure, WorkOrderList>> searchWorkOrderList(
      Map<String, dynamic> params);
  Future<Either<Failure, Unit>> updateRemarkText(Map<String, dynamic> params);
  Future<Either<Failure, Unit>> saveWorkOrder(Map<String, dynamic> params);
  Future<Either<Failure, Unit>> saveWorkOrderList(
      List<Map<String, dynamic>> params);
  Future<Either<Failure, Unit>> startCancelWorkOrder(
      Map<String, dynamic> params);
  Future<Either<Failure, Unit>> startCancelWorkOrderList(
      List<Map<String, dynamic>> params);
  Future<Either<Failure, QmWorkOrderList>> fetchQmWorkOrderList();
  Future<Either<Failure, Unit>> saveQmWorkOrder(Map<String, dynamic> params);
  Future<Either<Failure, QmWorkOrderList>> searchQmWorkOrderList(
      Map<String, dynamic> params);
}
