import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_state.freezed.dart';

@freezed
class VersionState with _$VersionState {
  const VersionState._();
  const factory VersionState.init() = _Init;
  const factory VersionState.checking() = _Checking;
  const factory VersionState.outdated(
      String localVersion, String latestVersion) = _Outdated;
  const factory VersionState.upToDate(String latestVersion) = _UpToDate;
  const factory VersionState.failure(String message) = _Failure;
}
