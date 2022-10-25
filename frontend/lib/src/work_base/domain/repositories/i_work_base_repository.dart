import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/work_base/domain/entities/work_base_info.dart';

/// Implementations are seperated for architectural reasons.
/// To find implementation details,
/// go to lib/src/work_base/infrastructure/repositories/work_base_repository.dart
/// for implementation
abstract class IWorkBaseRepository {
  Future<Either<Failure, List<WorkBaseInfo>>> fetchWorkBases(
      Map<String, dynamic> params);
}
