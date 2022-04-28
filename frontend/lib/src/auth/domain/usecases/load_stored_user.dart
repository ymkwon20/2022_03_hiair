import 'package:frontend/src/auth/domain/entities/user.dart';
import 'package:frontend/src/auth/domain/repositories/i_auth_repository.dart';

class LoadStoredUser {
  final IAuthRepository _repository;

  const LoadStoredUser({
    required IAuthRepository repository,
  }) : _repository = repository;

  Future<User?> call([void params]) async {
    return _repository.getSignedInUser();
  }
}
