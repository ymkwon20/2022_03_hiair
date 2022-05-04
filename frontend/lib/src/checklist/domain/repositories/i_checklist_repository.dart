import 'package:dartz/dartz.dart';
import 'package:frontend/src/checklist/domain/entities/checklist.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';

abstract class IChecklistRepository {
  Future<Either<Failure, List<Checklist>>> fetchChecklist(
      Map<String, dynamic> params);
}
