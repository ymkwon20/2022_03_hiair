import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/src/checklist/domain/entities/check_image.dart';

import 'package:frontend/src/checklist/domain/entities/check_item.dart';
import 'package:frontend/src/checklist/domain/entities/check_type.dart';
import 'package:frontend/src/checklist/domain/entities/combo.dart';
import 'package:frontend/src/checklist/infrastructure/datasources/checklist_service.dart';
import 'package:frontend/src/checklist/infrastructure/dtos/check_image_dto.dart';
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
    return _fetchChecklistByUrl("/checklist", params);
  }

  @override
  Future<List<CheckItem>> fetchCutChecklist(Map<String, dynamic> params) async {
    return _fetchChecklistByUrl("/cut-checklist", params);
  }

  @override
  Future<List<CheckItem>> fetchWorkOrderChecklist(
      Map<String, dynamic> params) async {
    return _fetchChecklistByUrl("/cut-checklist", params);
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

  @override
  Future<void> saveImagelist(List<Map<String, dynamic>> params) async {
    try {
      await _dio.post("/checklist/images", data: params);
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

      if (response.data == null) {
        return [];
      }

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

  @override
  Future<List<CheckImage>> fetchCheckimagelist(
      Map<String, dynamic> params) async {
    try {
      final response =
          await _dio.get("/checklist/images", queryParameters: params);

      if (response.data == null) {
        return [];
      }

      final data = (response.data as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>);

      final results =
          data.map((e) => CheckImageDto.fromMap(e).toDomain()).toList();

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

  Future<List<CheckItem>> _fetchChecklistByUrl(
      String endpoint, Map<String, dynamic> params) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: params);

      if (response.data == null) {
        return [];
      }

      final data = (response.data as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>);

      final results =
          data.map((e) => CheckItemDto.fromMap(e).toDomain()).toList();

      for (var i = 0; i < results.length; i++) {
        if (results[i].checkType == CheckType.combo) {
          final comboList = await _fetchUnitList(results[i].valueComboCd);
          results[i] = results[i].copyWith(
            valueCombos: comboList,
          );
        }

        if (results[i].unitType == UnitType.combo) {
          final comboList = await _fetchUnitList(results[i].unitComboCd);
          results[i] = results[i].copyWith(
            unitCombos: comboList,
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
}
