import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_event.freezed.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const SettingsEvent._();
  const factory SettingsEvent.loadTheme() = _LoadTheme;
  const factory SettingsEvent.updateTheme(String theme) = _UpdateTheme;
}
