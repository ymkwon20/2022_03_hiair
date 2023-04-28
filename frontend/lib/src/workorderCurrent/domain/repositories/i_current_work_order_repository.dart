import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/workorderCurrent/domain/entities/current_work_order_list.dart';

abstract class ICurrentWorkOrderRepository {
  Future<Either<Failure, CurrentWorkOrderList>> fetchCurrentWorkOrderList(
      Map<String, dynamic> params);
}
