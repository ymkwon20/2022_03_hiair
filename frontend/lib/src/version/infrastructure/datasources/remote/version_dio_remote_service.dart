import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/src/core/infrastrucutre/dio_extensions.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/version/infrastructure/datasources/remote/version_remove_service.dart';

class VersionDioRemoteService implements VersionRemoteService {
  final Dio _dio;

  const VersionDioRemoteService({required Dio httpClient}) : _dio = httpClient;

  @override
  Future<String> fetchLatestVersion() async {
    try {
      final response = await _dio.get("/apk");

      if ((response.data as List).isEmpty) {
        return "";
      }

      return response.data[0]["APK_V"];
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

      if (e.response?.statusCode == 400) {
        throw ServerConnectionException(message: e.message);
      }

      rethrow;
    }
  }

  @override
  Future<String> fetchLatestUrl() {
    // TODO: implement fetchLatestUrl
    // --
    throw UnimplementedError();
  }
}
