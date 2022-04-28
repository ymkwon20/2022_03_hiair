import 'package:dartz/dartz.dart';
import 'package:frontend/src/auth/domain/entities/auth_failure.dart';
import 'package:frontend/src/auth/domain/entities/user.dart';
import 'package:frontend/src/auth/domain/repositories/i_auth_repository.dart';

class SignIn {
  final IAuthRepository _repository;

  const SignIn({
    required IAuthRepository repository,
  }) : _repository = repository;

  Future<Either<AuthFailure, User>> call(Map<String, dynamic> params) async {
    return _repository.signIn(params);
  }
}
