import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/src/core/infrastrucutre/dio_extensions.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/impeller/infrastructure/datasources/impeller_service.dart';
import 'package:frontend/src/impeller/infrastructure/dtos/impeller_list_dto.dart';

class ImpellerRemoteService implements ImpellerService {
  final Dio _dio;

  const ImpellerRemoteService({
    required Dio httpClient,
  }) : _dio = httpClient;

  @override
  Future<ImpellerListDto> fetchImpellerList(Map<String, dynamic> params) async {
    try {
      final response = await _dio.get(
        "/order",
        queryParameters: params,
      );

      if (response.data == null) {
        return const ImpellerListDto(isNextAvailable: false, items: []);
      }

      final results = (response.data as Map<String, dynamic>);

      return ImpellerListDto.fromMap(results);
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

      if (e.type == DioErrorType.other) {
        throw ServerConnectionException(message: e.message);
      }

      rethrow;
    }
  }

  @override
  Future<void> saveImpeller(Map<String, dynamic> params) async {
    try {
      await _dio.post("/order", data: params);
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
  Future<void> saveImpellerList(List<Map<String, dynamic>> params) async {
    try {
      await _dio.post("/orders", data: params);
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
