import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._();
  const factory Failure.internal([String? message]) = _Internal;
  const factory Failure.server([String? message]) = _Server;
  const factory Failure.noConnection([String? message]) = _NoConnection;
}

/// set failure message upon each failure
String mapFailureToString(Failure failure) {
  return failure.when(
    internal: (String? message) => message ?? "기기 내부에서 문제가 발생하였습니다.",
    server: (String? message) => message ?? "서버로부터 데이터를 받아오는데 문제가 발생하였습니다",
    noConnection: (String? message) => message ?? "인터넷 연결이 불안정합니다",
  );
}
