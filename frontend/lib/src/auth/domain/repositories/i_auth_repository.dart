import 'package:dartz/dartz.dart';
import 'package:frontend/src/auth/domain/entities/auth_failure.dart';
import 'package:frontend/src/auth/domain/entities/user.dart';

abstract class IAuthRepository {
  Future<User?> getSignedInUser();
  Future<Either<AuthFailure, User>> signIn(Map<String, dynamic> params);
  Future<Either<AuthFailure, Unit>> signOut();
}
