import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/src/core/errors/dio_extensions.dart';
import 'package:frontend/src/core/errors/exceptions.dart';

import 'package:frontend/src/fct/domain/entities/fct.dart';
import 'package:frontend/src/fct/infrastructure/datasources/i_fct_service.dart';
import 'package:frontend/src/fct/infrastructure/dtos/fct_dto.dart';

class FctRemoteService implements IFctService {
  final Dio _dio;

  const FctRemoteService({
    required Dio httpClient,
  }) : _dio = httpClient;

  /// 받아야하는 parameter가 단순히 하나 이기 때문에 domain, dto 만들지 않음
  @override
  Future<List<String>> getFctSerials() async {
    try {
      final response = await _dio.get(
        "/fct",
      );

      if (response.data == null) {
        return [];
      }

      final data = (response.data as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>);

      return data.map((item) => item["METAL_DATE"] as String).toList();
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
  Future<List<Fct>> getFctItems(String serial) async {
    try {
      final response = await _dio.get(
        "/fct/$serial",
      );

      final data = (response.data as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>);

      return data.map((map) => FctDto.fromMap(map).toDomain()).toList();
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
  Future<void> saveFctItem(List<Map<String, dynamic>> params) async {
    try {
      await _dio.post("/fct", data: params);
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

      rethrow;
    }
  }
}
