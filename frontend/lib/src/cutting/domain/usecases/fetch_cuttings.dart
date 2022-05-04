import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';

import 'package:frontend/src/core/domain/usecases/usecase.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_serial.dart';
import 'package:frontend/src/cutting/domain/repositories/i_cutting_repository.dart';

class FetchCuttings implements Usecase<List<CuttingSerial>, void> {
  final ICuttingRepository _repository;

  const FetchCuttings({
    required ICuttingRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, List<CuttingSerial>>> call([void params]) async {
    return await _repository.getCuttings();
  }
}
