/// Server연결이 제대로 되지 않을 때 Exception
class ServerConnectionException implements Exception {
  final String message;
  const ServerConnectionException({
    required this.message,
  });
}

/// Server에서 statusCode 500을 받았을 때 Exception
class InvalidServerResponseException implements Exception {
  final String message;
  const InvalidServerResponseException({
    required this.message,
  });
}

/// 인터넷 연결이 없을 때 사용한 Exception
class NoConnectionException implements Exception {
  final String message;
  const NoConnectionException({
    required this.message,
  });
}

/// 사진을 불러올 때 지원하지 않는 OS에서 구동할때 Exception
class UnsupportedPlatformException implements Exception {}

/// 설정값 세팅을 불러올 때 Exception
class InternalException implements Exception {}

/// 사진을 불러올 때 지원하지 않는 OS에서 구동할때 Exception
class NotSelectedException implements Exception {}
