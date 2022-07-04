import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/workorder/domain/entities/qm_work_order_list.dart';

import 'package:frontend/src/workorder/domain/repositories/i_work_order_repository.dart';

class FetchQmWorkOrderList {
  final IWorkOrderRepository _repository;

  const FetchQmWorkOrderList({
    required IWorkOrderRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, QmWorkOrderList>> call() async {
    return _repository.fetchQmWorkOrderList();
  }
}
