import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/work_base/domain/entities/work_base_info.dart';

abstract class IWorkBaseRepository {
  Future<Either<Failure, List<WorkBaseInfo>>> fetchWorkBases(
      Map<String, dynamic> params);
}
