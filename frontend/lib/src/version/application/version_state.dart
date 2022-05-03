import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_state.freezed.dart';

@freezed
class VersionState with _$VersionState {
  const VersionState._();
  const factory VersionState.init() = _Init;
  const factory VersionState.loading() = _Loading;
  const factory VersionState.loaded(String version) = _Loaded;
  const factory VersionState.failure(String message) = _Failure;
}
