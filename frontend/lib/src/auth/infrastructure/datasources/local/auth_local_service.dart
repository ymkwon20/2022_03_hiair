import 'package:frontend/src/auth/infrastructure/dtos/user_dto.dart';

abstract class AuthLocalService {
  Future<UserDTO?> read();
  Future<void> save(UserDTO userDTO);
  Future<void> clear();
}
