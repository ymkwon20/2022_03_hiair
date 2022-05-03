import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/src/core/errors/dio_extensions.dart';
import 'package:frontend/src/core/errors/exceptions.dart';
import 'package:frontend/src/version/infrastructure/datasources/version_service.dart';

class VersionRemoteService implements VersionService {
  final Dio _dio;

  const VersionRemoteService({required Dio httpClient}) : _dio = httpClient;

  @override
  Future<String> fetchLatestApkVersion() async {
    try {
      final response = await _dio.get("/apk");

      return response.data[0]["version"];
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw NoConnectionException(message: e.message);
      }

      if (e.response?.statusCode == 500) {
        final response = jsonDecode(e.response?.data) as Map<String, dynamic>;
        throw InvalidServerResponseException(
          message: response["msg"],
        );
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
