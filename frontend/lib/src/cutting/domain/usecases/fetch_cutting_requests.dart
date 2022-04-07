import 'package:dartz/dartz.dart';

import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/core/usecases/usecase.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_request.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_serial.dart';
import 'package:frontend/src/cutting/domain/repositories/i_cutting_repository.dart';

class FetchCuttingRequests
    implements Usecase<List<CuttingRequest>, CuttingSerial> {
  final ICuttingRepository _repository;
  FetchCuttingRequests({
    required ICuttingRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, List<CuttingRequest>>> call(
      [CuttingSerial? params]) async {
    return await _repository.getCuttingRequest(params!);
  }
}
