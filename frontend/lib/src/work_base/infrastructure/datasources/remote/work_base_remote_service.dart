import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/src/core/infrastrucutre/dio_extensions.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';

import 'package:frontend/src/work_base/domain/entities/work_base_info.dart';
import 'package:frontend/src/work_base/infrastructure/datasources/work_base_service.dart';
import 'package:frontend/src/work_base/infrastructure/dtos/work_base_info_dto.dart';

class WorkBaseRemoteService implements WorkBaseService {
  final Dio _dio;

  const WorkBaseRemoteService({
    required Dio httpClient,
  }) : _dio = httpClient;

  @override
  Future<List<WorkBaseInfo>> fetchWorkBases(Map<String, dynamic> params) async {
    try {
      final response = await _dio.get(
        "/wb",
        queryParameters: params,
      );

      if (response.data == null) {
        return [];
      }

      final data = (response.data as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>);

      return data
          .map((item) => WorkBaseInfoDto.fromMap(item).toDomain())
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
}
