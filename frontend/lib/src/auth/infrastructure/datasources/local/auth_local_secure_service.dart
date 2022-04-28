import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:frontend/src/auth/infrastructure/datasources/local/auth_local_service.dart';
import 'package:frontend/src/auth/infrastructure/dtos/user_dto.dart';

class AuthLocalSecureService implements AuthLocalService {
  final FlutterSecureStorage _storage;

  AuthLocalSecureService({
    required FlutterSecureStorage storage,
  }) : _storage = storage;

  static const _key = "user-info";

  UserDTO? _cachedUser;

  @override
  Future<UserDTO?> read() async {
    if (_cachedUser != null) {
      return _cachedUser;
    }

    final json = await _storage.read(key: _key);
    if (json == null) {
      return null;
    }
    try {
      return _cachedUser = UserDTO.fromJson(json);
    } on FormatException {
      return null;
    }
  }

  @override
  Future<void> save(UserDTO user) async {
    try {
      _cachedUser = user;
      return _storage.write(key: _key, value: user.toJson());
    } on PlatformException {
      rethrow;
    }
  }

  @override
  Future<void> clear() async {
    try {
      _cachedUser = null;
      return _storage.delete(key: _key);
    } on PlatformException {
      rethrow;
    }
  }
}
