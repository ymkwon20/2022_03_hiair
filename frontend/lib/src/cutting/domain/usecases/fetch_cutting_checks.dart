import 'package:dartz/dartz.dart';

import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/core/usecases/usecase.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_check.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_serial.dart';
import 'package:frontend/src/cutting/domain/repositories/i_cutting_repository.dart';

class FetchCuttingChecks implements Usecase<List<CuttingCheck>, CuttingSerial> {
  final ICuttingRepository _repository;

  const FetchCuttingChecks({
    required ICuttingRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, List<CuttingCheck>>> call(
      [CuttingSerial? params]) async {
    return await _repository.getCuttingCheck(params!);
  }
}
