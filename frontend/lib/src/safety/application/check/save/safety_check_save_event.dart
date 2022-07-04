import 'package:freezed_annotation/freezed_annotation.dart';

part 'safety_check_save_event.freezed.dart';

@freezed
class SafetyCheckSaveEvent with _$SafetyCheckSaveEvent {
  const SafetyCheckSaveEvent._();
  const factory SafetyCheckSaveEvent.saveChecks(String date) = _SaveChecks;
}
