import 'package:dio/dio.dart';

import 'package:frontend/src/auth/infrastructure/datasources/remote/auth_remote_service.dart';
import 'package:frontend/src/auth/infrastructure/dtos/user_dto.dart';
import 'package:frontend/src/core/errors/exceptions.dart';

import 'package:frontend/src/core/errors/dio_extensions.dart';

class AuthRemoteDioService implements AuthRemoteService {
  final Dio _dio;

  const AuthRemoteDioService({
    required Dio httpClient,
  }) : _dio = httpClient;

  @override
  Future<UserDTO?> signIn(Map<String, dynamic> params) async {
    try {
      final response = await _dio.post("/sign-in", data: params);

      if (response.data == null) {
        return null;
      }

      final data = (response.data as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>);

      if (data.isEmpty) {
        return null;
      }

      return UserDTO.fromMap(data.first);
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw NoConnectionException(message: e.message);
      }

      if (e.response?.statusCode == 500) {
        throw InvalidServerResponseException(message: e.message);
      }

      if (e.type == DioErrorType.connectTimeout) {
        throw ServerConnectionException(message: e.message);
      }

      if (e.type == DioErrorType.receiveTimeout) {
        throw ServerConnectionException(message: e.message);
      }

      rethrow;
    }
  }
}
