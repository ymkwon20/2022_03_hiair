import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/src/core/infrastrucutre/dio_extensions.dart';
import 'package:frontend/src/core/infrastrucutre/exceptions.dart';

import 'i_image_remote_service.dart';

class ImageDioRemoteService implements IImageRemoteService {
  final Dio _dio;

  const ImageDioRemoteService({
    required Dio httpClient,
  }) : _dio = httpClient;

  @override
  Future<void> saveImages(List<String> images) async {
    try {
      final formData = FormData();
      final imageParams = <MapEntry<String, MultipartFile>>[];

      for (final imagePath in images) {
        final img = MultipartFile.fromFileSync(imagePath, filename: imagePath);
        imageParams.add(MapEntry("file", img));
      }

      formData.files.addAll(imageParams);
      await _dio.post("/images", data: formData);
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
