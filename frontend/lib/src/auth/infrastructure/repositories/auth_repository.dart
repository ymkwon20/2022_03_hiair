import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import 'package:frontend/src/auth/domain/entities/auth_failure.dart';
import 'package:frontend/src/auth/domain/entities/user.dart';
import 'package:frontend/src/auth/domain/repositories/i_auth_repository.dart';
import 'package:frontend/src/auth/infrastructure/datasources/local/auth_local_service.dart';
import 'package:frontend/src/auth/infrastructure/datasources/remote/auth_remote_service.dart';
import 'package:frontend/src/core/errors/exceptions.dart';

class AuthRepository implements IAuthRepository {
  final AuthLocalService _localService;
  final AuthRemoteService _remoteService;

  const AuthRepository({
    required AuthLocalService localService,
    required AuthRemoteService remoteService,
  })  : _remoteService = remoteService,
        _localService = localService;

  // 기기에 저장된 정보 가져오기
  @override
  Future<User?> getSignedInUser() async {
    try {
      final storedUserDto = await _localService.read();
      return storedUserDto?.toDomain();
    } on PlatformException {
      // TODO(ymkwon): null로 던질 것인지 아니면 함수형 Either로 던질 것인지 생각해보기
      return null;
    }
  }

  /// 로그인
  @override
  Future<Either<AuthFailure, User>> signIn(Map<String, dynamic> params) async {
    try {
      final remoteFetch = await _remoteService.signIn(params);

      if (remoteFetch == null) {
        return left(const AuthFailure.server('해당 사용자를 찾을 수 없습니다.'));
      } else {
        // 받아온 정보 저장
        _localService.save(remoteFetch);
        return right(remoteFetch.toDomain());
      }
    } on NoConnectionException catch (e) {
      return left(AuthFailure.server(e.message));
    } on InvalidServerResponseException catch (e) {
      return left(AuthFailure.server(e.message));
    } on ServerConnectionException catch (e) {
      return left(AuthFailure.server(e.message));
    } on PlatformException {
      return left(const AuthFailure.storage("로그인 정보를 저장하는 중 에러가 발생하였습니다."));
    }
  }

  // 로그아웃
  @override
  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      await _localService.clear();
      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage("로그인 정보를 삭제하는 중 에러가 발생하였습니다."));
    }
  }
}
