import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_event.freezed.dart';

@freezed
class VersionEvent with _$VersionEvent {
  const VersionEvent._();
  const factory VersionEvent.fetchLatestApkVersionNo() = _FetchLatestVersionNo;
}
