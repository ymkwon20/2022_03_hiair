import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:frontend/src/checklist/domain/entities/checklist.dart';
import 'package:frontend/src/checklist/infrastructure/datasources/checklist_service.dart';
import 'package:frontend/src/checklist/infrastructure/dtos/checklist_dto.dart';
import 'package:frontend/src/core/infrastrucutre/dio_extensions.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';

class ChecklistRemoteService implements ChecklistService {
  final Dio _dio;

  const ChecklistRemoteService({
    required Dio httpClient,
  }) : _dio = httpClient;

  @override
  Future<List<Checklist>> fetchChecklist(Map<String, dynamic> params) async {
    try {
      final response = await _dio.get("/checklist", queryParameters: params);

      final data = (response.data as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>);

      return data.map((e) => ChecklistDto.fromMap(e).toDomain()).toList();
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
