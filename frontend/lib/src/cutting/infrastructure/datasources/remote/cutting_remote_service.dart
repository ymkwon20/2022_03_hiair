import 'package:dio/dio.dart';
import 'package:frontend/src/core/infrastrucutre/dio_extensions.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_check.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_check_detail.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_serial.dart';

import 'package:frontend/src/cutting/infrastructure/datasources/cutting_service.dart';
import 'package:frontend/src/cutting/infrastructure/dtos/cutting_check_dto.dart';
import 'package:frontend/src/cutting/infrastructure/dtos/cutting_check_detail_dto.dart';
import 'package:frontend/src/cutting/infrastructure/dtos/cutting_serial_dto.dart';

/// Cutting Feature에 대한 정보를 외부에서 받아오는 service
class CuttingRemoteService implements CuttingService {
  /// http client
  final Dio _dio;

  const CuttingRemoteService({
    required Dio httpClient,
  }) : _dio = httpClient;

  @override
  Future<List<CuttingSerial>> fetchCuttings() async {
    try {
      final response = await _dio.get("/cut");

      if (response.data == null) {
        return [];
      }

      final data = (response.data as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>);

      return data
          .map((map) => CuttingSerialDTO.fromMap(map).toDomain())
          .toList();
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw NoConnectionException(
          message: e.message,
        );
      }

      if (e.response?.statusCode == 500) {
        throw InvalidServerResponseException(
          message: e.message,
        );
      }

      if (e.type == DioErrorType.connectTimeout) {
        throw ServerConnectionException(
          message: e.message,
        );
      }

      if (e.type == DioErrorType.receiveTimeout) {
        throw ServerConnectionException(
          message: e.message,
        );
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

      if (response.data == null) {
        return [];
      }

      final data = (response.data as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>);

      return data
          .map((map) => CuttingCheckDTO.fromMap(map).toDomain())
          .toList();
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw NoConnectionException(message: e.message);
      }

      if (e.response?.statusCode == 500) {
        throw InvalidServerResponseException(
          message: e.message,
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
  Future<List<CuttingCheckDetail>> fetchCuttingRequests(
      CuttingSerial serial) async {
    try {
      final response = await _dio.get(
        "/cut/req",
        queryParameters: {
          "date": serial.dateRequested,
          "seq": serial.seq,
        },
      );

      if (response.data == null) {
        return [];
      }

      final data = (response.data as List<dynamic>)
          .map((dynamic item) => item as Map<String, dynamic>);

      return data
          .map((map) => CuttingCheckDetailDTO.fromMap(map).toDomain())
          .toList();
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw NoConnectionException(message: e.message);
      }

      if (e.response?.statusCode == 500) {
        throw InvalidServerResponseException(message: e.message);
      }

      if (e.type == DioErrorType.connectTimeout) {
        throw ServerConnectionException(
          message: e.message,
        );
      }

      if (e.type == DioErrorType.receiveTimeout) {
        throw ServerConnectionException(
          message: e.message,
        );
      }

      rethrow;
    }
  }

  @override
  Future<void> saveCuttingCheck(Map<String, dynamic> params) async {
    try {
      await _dio.post("/cut/check", data: params);
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw NoConnectionException(
          message: e.message,
        );
      }

      if (e.response?.statusCode == 500) {
        throw InvalidServerResponseException(message: e.message);
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
