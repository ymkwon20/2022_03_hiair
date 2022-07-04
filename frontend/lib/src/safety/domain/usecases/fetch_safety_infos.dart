import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/usecases/usecase.dart';
import 'package:frontend/src/safety/domain/entities/safety_info.dart';
import 'package:frontend/src/safety/domain/repositories/i_safety_repository.dart';

class FetchSafetyInfos
    implements Usecase<List<SafetyInfo>, Map<String, dynamic>> {
  final ISafetyRepository _repository;

  const FetchSafetyInfos({required ISafetyRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, List<SafetyInfo>>> call(
      [Map<String, dynamic>? params]) {
    return _repository.fetchSafetyInfo(params!);
  }
}
