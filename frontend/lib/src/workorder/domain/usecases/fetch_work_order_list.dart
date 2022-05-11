import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/workorder/domain/entities/work_order_list.dart';

import 'package:frontend/src/workorder/domain/repositories/i_work_order_repository.dart';

class FetchWorkOrderList {
  final IWorkOrderRepository _repository;

  const FetchWorkOrderList({
    required IWorkOrderRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, WorkOrderList>> call(
      Map<String, dynamic> params) async {
    return _repository.fetchWorkOrderList(params);
  }
}
