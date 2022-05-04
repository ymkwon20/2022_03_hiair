import 'package:dartz/dartz.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call([Params params]);
}
