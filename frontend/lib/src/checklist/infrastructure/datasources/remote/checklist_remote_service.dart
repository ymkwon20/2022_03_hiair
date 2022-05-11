import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:frontend/src/checklist/domain/entities/check_item.dart';
import 'package:frontend/src/checklist/domain/entities/check_type.dart';
import 'package:frontend/src/checklist/domain/entities/combo.dart';
import 'package:frontend/src/checklist/infrastructure/datasources/checklist_service.dart';
import 'package:frontend/src/checklist/infrastructure/dtos/check_item_dto.dart';
import 'package:frontend/src/checklist/infrastructure/dtos/combo_dto.dart';
import 'package:frontend/src/core/infrastrucutre/dio_extensions.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';

class ChecklistRemoteService implements ChecklistService {
  final Dio _dio;

  const ChecklistRemoteService({
    required Dio httpClient,
  }) : _dio = httpClient;

  @override
  Future<List<CheckItem>> fetchChecklist(Map<String, dynamic> params) async {
    try {
      final response = await _dio.get("/checklist", queryParameters: params);

      final data = (response.data as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>);

      final results =
          data.map((e) => CheckItemDto.fromMap(e).toDomain()).toList();

      for (var i = 0; i < results.length; i++) {
        if (results[i].checkType == CheckType.combo) {
          final comboList = await _fetchUnitList(results[i].comboCd);
          results[i] = results[i].copyWith(
            combos: comboList,
          );
        }
      }

      return results;
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
  Future<void> saveCheckitem(List<Map<String, dynamic>> params) async {
    try {
      await _dio.post("/checklist", data: params);
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

  Future<List<Combo>> _fetchUnitList(String code) async {
    try {
      final params = {"code": code};
      final response = await _dio.get("/unit", queryParameters: params);
      final data = (response.data as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>);
      return data.map((e) => ComboDto.fromMap(e).toDomain()).toList();
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
