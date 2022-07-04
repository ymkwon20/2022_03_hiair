import 'package:freezed_annotation/freezed_annotation.dart';

part 'safety_check_event.freezed.dart';

@freezed
class SafetyCheckEvent with _$SafetyCheckEvent {
  const SafetyCheckEvent._();
  const factory SafetyCheckEvent.fetchSafetyChecks(
      String code, String type, String date) = _FetchSafetyChecks;
}
