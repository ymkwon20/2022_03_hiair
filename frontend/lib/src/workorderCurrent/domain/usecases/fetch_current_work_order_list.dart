import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/workorderCurrent/domain/entities/current_work_order_list.dart';
import 'package:frontend/src/workorderCurrent/domain/repositories/i_current_work_order_repository.dart';

class FetchCurrentWorkOrderList {
  final ICurrentWorkOrderRepository _repository;

  const FetchCurrentWorkOrderList({
    required ICurrentWorkOrderRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, CurrentWorkOrderList>> call(
      Map<String, dynamic> params) async {
    return _repository.fetchCurrentWorkOrderList(params);
  }
}
