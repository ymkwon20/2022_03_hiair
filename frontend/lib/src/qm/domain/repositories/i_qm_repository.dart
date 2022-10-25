import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/qm/domain/entities/qm_menu.dart';

/// Implementations are seperated for architectural reasons.
/// To find implementation details,
/// go to lib/src/qm/infrastructure/repositories/qm_repository.dart
/// for implementation
abstract class IQmRepository {
  Future<Either<Failure, List<QmMenu>>> fetchQmMenulist(
      Map<String, dynamic> params);
}
