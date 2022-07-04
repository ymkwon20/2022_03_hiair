import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';
import 'package:frontend/src/workorder/domain/repositories/i_work_order_repository.dart';

class SaveQmWorkOrder implements Usecase<Unit, Map<String, dynamic>> {
  final IWorkOrderRepository _repository;

  const SaveQmWorkOrder({
    required IWorkOrderRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, Unit>> call([Map<String, dynamic>? params]) async {
    return await _repository.saveQmWorkOrder(params!);
  }
}
