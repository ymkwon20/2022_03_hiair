import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._();
  const factory Failure.server() = ServerError;
  const factory Failure.internal([String? message]) = _InternalError;
  const factory Failure.invalidInput() = _InvalidInput;
}
