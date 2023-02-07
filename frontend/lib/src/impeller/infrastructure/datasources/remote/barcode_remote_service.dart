import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/src/core/infrastrucutre/dio_extensions.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';
import 'package:frontend/src/impeller/infrastructure/datasources/barcode_service.dart';
import 'package:frontend/src/impeller/infrastructure/dtos/qrbarcode_dto.dart';

class BarcodeRemoteService implements BarcodeService {
  final Dio _dio;

  const BarcodeRemoteService({
    required Dio httpClient,
  }) : _dio = httpClient;

  @override
  Future<QRBarcodeDto> getQRCode(Map<String, dynamic> params) async {
    try {
      final response = await _dio.get(
        "/barcode",
        queryParameters: params,
      );

      if (response.data == null) {
        return const QRBarcodeDto(qrBarcodeString: "");
      }

      final results = (response.data[0] as Map<String, dynamic>);

      return QRBarcodeDto.fromMap(results);
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
