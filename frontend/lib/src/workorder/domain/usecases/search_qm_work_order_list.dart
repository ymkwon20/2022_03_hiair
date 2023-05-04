import 'package:dartz/dartz.dart';
import 'package:frontend/src/workorder/domain/entities/qm_work_order_list.dart';

import '../../../core/domain/entities/failure.dart';
import '../repositories/i_work_order_repository.dart';

class SearchQmWorkOrderList {
  final IWorkOrderRepository _repository;

  const SearchQmWorkOrderList({
    required IWorkOrderRepository repository,
  }) : _repository = repository;

  Future<Either<Failure, QmWorkOrderList>> call(
      Map<String, dynamic> params) async {
    return _repository.searchQmWorkOrderList(params);
  }
}
