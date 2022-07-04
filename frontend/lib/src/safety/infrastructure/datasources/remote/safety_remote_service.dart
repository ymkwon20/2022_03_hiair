import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/src/core/infrastrucutre/dio_extensions.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/safety/domain/entities/safety_check.dart';
import 'package:frontend/src/safety/domain/entities/safety_info.dart';
import 'package:frontend/src/safety/infrastructure/datasources/safety_service.dart';
import 'package:frontend/src/safety/infrastructure/dtos/safety_check_dto.dart';
import 'package:frontend/src/safety/infrastructure/dtos/safety_info_dto.dart';

class SafetyRemoteService implements SafetyService {
  const SafetyRemoteService({
    required Dio httpClient,
  }) : _dio = httpClient;

  final Dio _dio;

  @override
  Future<List<SafetyInfo>> fetchSafetyInfos(Map<String, dynamic> params) async {
    try {
      final response = await _dio.get(
        "/safety",
        queryParameters: params,
      );

      if (response.data == null) {
        return [];
      }

      final data = (response.data as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>);

      return data
          .map((item) => SafetyInfoDto.fromMap(item).toDomain())
          .toList();
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

  @override
  Future<List<SafetyCheck>> fetchSafetyChecks(
      Map<String, dynamic> params) async {
    try {
      final code = params["code"];

      final response = await _dio.get(
        "/safety/$code",
        queryParameters: params,
      );

      if (response.data == null) {
        return [];
      }

      final data = (response.data as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>);

      return data
          .map((item) => SafetyCheckDto.fromMap(item).toDomain())
          .toList();
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

  @override
  Future<void> saveSafetyChecks(List<Map<String, dynamic>> params) async {
    try {
      await _dio.post("/safety", data: params);
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw NoConnectionException(
          message: e.message,
        );
      }

      if (e.response?.statusCode == 500) {
        final response = jsonDecode(e.response?.data) as Map<String, dynamic>;
        throw InvalidServerResponseException(
          message: response["msg"],
        );
      }

      if (e.type == DioErrorType.connectTimeout) {
        throw ServerConnectionException(
          message: e.message,
        );
      }

      if (e.type == DioErrorType.receiveTimeout) {
        throw ServerConnectionException(message: e.message);
      }

      if (e.type == DioErrorType.other) {
        throw ServerConnectionException(message: e.message);
      }
      rethrow;
    }
  }

  @override
  Future<void> saveSafetyRepairInfo(Map<String, dynamic> params) async {
    try {
      await _dio.post("/safety/repair", data: params);
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw NoConnectionException(
          message: e.message,
        );
      }

      if (e.response?.statusCode == 500) {
        final response = jsonDecode(e.response?.data) as Map<String, dynamic>;
        throw InvalidServerResponseException(
          message: response["msg"],
        );
      }

      if (e.type == DioErrorType.connectTimeout) {
        throw ServerConnectionException(
          message: e.message,
        );
      }

      if (e.type == DioErrorType.receiveTimeout) {
        throw ServerConnectionException(message: e.message);
      }

      if (e.type == DioErrorType.other) {
        throw ServerConnectionException(message: e.message);
      }

      rethrow;
    }
  }
}
