import 'package:dartz/dartz.dart';
import 'package:frontend/src/checklist/domain/entities/check_image.dart';
import 'package:frontend/src/checklist/domain/entities/check_item.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';

/// Implementations are seperated for architectural reasons.
/// To find implementation details,
/// go to lib/src/checklist/infrastructure/repositories/checklist_repository.dart
/// for implementation
abstract class IChecklistRepository {
  Future<Either<Failure, List<CheckItem>>> fetchChecklist(
      Map<String, dynamic> params);
  Future<Either<Failure, List<CheckItem>>> fetchCutChecklist(
      Map<String, dynamic> params);
  Future<Either<Failure, List<CheckItem>>> fetchWorkOrderChecklist(
      Map<String, dynamic> params);
  Future<Either<Failure, List<CheckImage>>> fetchCheckimagelist(
      Map<String, dynamic> params);
  Future<Either<Failure, List<CheckItem>>> fetchChecklistActivate(
      Map<String, dynamic> params);
  Future<Either<Failure, Unit>> fetchAndSaveChecklist(
      Map<String, dynamic> params);
  Future<Either<Failure, Unit>> saveCheckitem(
      List<Map<String, dynamic>> params);
  Future<Either<Failure, Unit>> saveImagelist(
      List<Map<String, dynamic>> params);
}
