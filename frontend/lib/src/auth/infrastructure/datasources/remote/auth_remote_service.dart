import 'package:frontend/src/auth/infrastructure/dtos/user_dto.dart';

abstract class AuthRemoteService {
  Future<UserDTO?> signIn(Map<String, dynamic> params);
}
