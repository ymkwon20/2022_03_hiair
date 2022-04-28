import 'package:dartz/dartz.dart';
import 'package:frontend/src/auth/domain/entities/auth_failure.dart';
import 'package:frontend/src/auth/domain/repositories/i_auth_repository.dart';

class SignOut {
  final IAuthRepository _repository;

  const SignOut({
    required IAuthRepository repository,
  }) : _repository = repository;

  Future<Either<AuthFailure, Unit>> call() async {
    return _repository.signOut();
  }
}
