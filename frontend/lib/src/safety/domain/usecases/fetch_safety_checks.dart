import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';
import 'package:frontend/src/safety/domain/entities/safety_check.dart';
import 'package:frontend/src/safety/domain/repositories/i_safety_repository.dart';

class FetchSafetyChecks
    implements Usecase<List<SafetyCheck>, Map<String, dynamic>> {
  final ISafetyRepository _repository;

  const FetchSafetyChecks({
    required ISafetyRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, List<SafetyCheck>>> call(
      [Map<String, dynamic>? params]) async {
    return _repository.fetchSafetyChecks(params!);
  }
}
