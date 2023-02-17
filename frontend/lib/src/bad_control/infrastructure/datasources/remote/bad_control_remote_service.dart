import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/src/bad_control/infrastructure/datasources/bad_control_service.dart';
import 'package:frontend/src/checklist/domain/entities/combo.dart';
import 'package:frontend/src/checklist/infrastructure/dtos/combo_dto.dart';
import 'package:frontend/src/core/infrastrucutre/dio_extensions.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';

class BadControlRemoteService implements BadControlService {
  final Dio _dio;

  const BadControlRemoteService({
    required Dio httpClilent,
  }) : _dio = httpClilent;

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
  Future<void> getComboListByCD(List<Map<String, dynamic>> params) {
    // TODO: implement getComboListByCD
    throw UnimplementedError();
  }
}
