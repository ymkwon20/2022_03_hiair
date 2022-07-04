import 'package:freezed_annotation/freezed_annotation.dart';

part 'safety_info_event.freezed.dart';

@freezed
class SafetyInfoEvent with _$SafetyInfoEvent {
  const SafetyInfoEvent._();
  const factory SafetyInfoEvent.fetchSafetyInfos(String code) =
      _FetchSafetyInfos;
}
