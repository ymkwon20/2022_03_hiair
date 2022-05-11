import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';
import 'package:frontend/src/workorder/domain/repositories/i_work_order_repository.dart';

class SaveWorkOrderList implements Usecase<Unit, List<Map<String, dynamic>>> {
  final IWorkOrderRepository _repository;

  const SaveWorkOrderList({
    required IWorkOrderRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, Unit>> call(
      [List<Map<String, dynamic>>? params]) async {
    return _repository.saveWorkOrderList(params!);
  }
}
