import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/src/core/infrastrucutre/dio_extensions.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';

import 'package:frontend/src/qm/domain/entities/qm_menu.dart';
import 'package:frontend/src/qm/infrastructure/datasources/qm_service.dart';
import 'package:frontend/src/qm/infrastructure/dtos/qm_menu_dto.dart';

class QmRemoteService implements QmService {
  final Dio _dio;
  const QmRemoteService({
    required Dio httpClient,
  }) : _dio = httpClient;

  @override
  Future<List<QmMenu>> fetchQmMenulist(Map<String, dynamic> params) async {
    try {
      final response = await _dio.get(
        "/menu",
        queryParameters: params,
      );

      if (response.data == null) {
        return [];
      }

      final data = (response.data as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>);

      return data.map((item) => QmMenuDto.fromMap(item).toDomain()).toList();
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
