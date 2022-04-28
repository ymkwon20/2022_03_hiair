import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/errors/failure.dart';
import 'package:frontend/src/fct/domain/entities/fct.dart';

abstract class IFctRepository {
  Future<Either<Failure, List<String>>> getFctSerials();
  Future<Either<Failure, List<Fct>>> getFctItems(String serial);
  Future<Either<Failure, Unit>> saveFctItems(List<Map<String, dynamic>> params);
}
