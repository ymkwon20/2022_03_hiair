import 'package:dio/dio.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

final dioProvider = Provider<Dio>(
  (ref) => Dio(
    BaseOptions(
      baseUrl: LogicConstant.baseApiServerUrl,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    ),
  ),
);

final uuidProvider = Provider<Uuid>(
  (ref) => const Uuid(),
);
