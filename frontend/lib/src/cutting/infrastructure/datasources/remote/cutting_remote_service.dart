import 'package:dio/dio.dart';
import 'package:frontend/src/core/errors/exceptions.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_check.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_request.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_serial.dart';

import 'package:frontend/src/cutting/infrastructure/datasources/cutting_service.dart';
import 'package:frontend/src/cutting/infrastructure/dtos/cutting_check_dto.dart';
import 'package:frontend/src/cutting/infrastructure/dtos/cutting_request_dto.dart';
import 'package:frontend/src/cutting/infrastructure/dtos/cutting_serial_dto.dart';

import 'package:frontend/src/core/errors/dio_extensions.dart';

/// Cutting Feature에 대한 정보를 외부에서 받아오는 service
class CuttingRemoteService implements CuttingService {
  /// http client
  final Dio _dio;

  const CuttingRemoteService({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<List<CuttingSerial>> fetchCuttings() async {
    try {
      final response = await _dio.get("/cut");

      final data = (response.data as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>);

      return data
          .map((map) => CuttingSerialDTO.fromMap(map).toDomain())
          .toList();
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw NoConnectionException();
      }

      if (e.response?.statusCode == 500) {
        throw InvalidServerResponseException();
      }

      if (e.type == DioErrorType.connectTimeout) {
        throw ServerConnectionException();
      }

      rethrow;
    }
  }

  @override
  Future<List<CuttingCheck>> fetchCuttingChecks(CuttingSerial serial) async {
    try {
      final response = await _dio.get(
        "/cut/check",
        queryParameters: {
          "date": serial.dateRequested,
          "seq": serial.seq,
        },
      );

      final data = (response.data as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>);

      return data
          .map((map) => CuttingCheckDTO.fromMap(map).toDomain())
          .toList();
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw NoConnectionException();
      }

      if (e.response?.statusCode == 500) {
        throw InvalidServerResponseException();
      }

      if (e.type == DioErrorType.connectTimeout) {
        throw ServerConnectionException();
      }

      rethrow;
    }
  }

  @override
  Future<List<CuttingRequest>> fetchCuttingRequests(
      CuttingSerial serial) async {
    try {
      final response = await _dio.get(
        "/cut/req",
        queryParameters: {
          "date": serial.dateRequested,
          "seq": serial.seq,
        },
      );

      final data = (response.data as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>);

      return data
          .map((map) => CuttingRequestDTO.fromMap(map).toDomain())
          .toList();
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw NoConnectionException();
      }

      if (e.response?.statusCode == 500) {
        throw InvalidServerResponseException();
      }

      if (e.type == DioErrorType.connectTimeout) {
        throw ServerConnectionException();
      }

      rethrow;
    }
  }
}
