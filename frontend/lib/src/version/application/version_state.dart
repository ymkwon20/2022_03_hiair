import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_state.freezed.dart';

@freezed
class VersionState with _$VersionState {
  const VersionState._();
  const factory VersionState.init() = _Init;
  const factory VersionState.checking() = _Checking;
  const factory VersionState.outdated() = _Outdated;
  const factory VersionState.upToDate() = _UpToDate;
  const factory VersionState.failure(String message) = _Failure;
}
