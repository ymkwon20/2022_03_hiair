import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/src/core/infrastrucutre/dio_extensions.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/workorderCurrent/infrastructure/datasources/current_work_order_service.dart';
import 'package:frontend/src/workorderCurrent/infrastructure/dtos/current_work_order_list_dto.dart';

class CurrentWorkOrderRemoteService implements CurrentWorkOrderService {
  final Dio _dio;

  const CurrentWorkOrderRemoteService({
    required Dio httpClient,
  }) : _dio = httpClient;

  @override
  Future<CurrentWorkOrderListDto> fetchCurrentWorkOrderList(
      Map<String, dynamic> params) async {
    try {
      final response = await _dio.get(
        "/corder",
        queryParameters: params,
      );

      if (response.data == null) {
        return const CurrentWorkOrderListDto(items: []);
      }

      final results = (response.data as Map<String, dynamic>);

      return CurrentWorkOrderListDto.fromMap(results);
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
}
