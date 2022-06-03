import 'package:dio/dio.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider<Dio>(
  (ref) => Dio(
    BaseOptions(
      baseUrl: LogicConstant.baseApiServerUrl,
      connectTimeout: 10000,
      receiveTimeout: 10000,
    ),
  ),
);
