import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/fct/domain/entities/fct.dart';

/// Implementations are seperated for architectural reasons.
/// To find implementation details,
/// go to lib/src/fct/infrastructure/repositories/fct_repository.dart
/// for implementation
abstract class IFctRepository {
  Future<Either<Failure, List<String>>> getFctSerials();
  Future<Either<Failure, List<Fct>>> getFctItems(String serial);
  Future<Either<Failure, Unit>> saveFctItems(List<Map<String, dynamic>> params);
}
