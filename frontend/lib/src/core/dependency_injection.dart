import 'package:dio/dio.dart';
import 'package:frontend/src/core/constants/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider<Dio>(
  (ref) => Dio(
    BaseOptions(
      baseUrl: LogicConstant.baseApiServerUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    ),
  ),
);
