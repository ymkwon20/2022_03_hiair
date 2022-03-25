import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/settings/domain/entities/settings_info.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const SettingsState._();
  const factory SettingsState.empty() = _Empty;
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.loaded(SettingsInfo info) = _Loaded;
  const factory SettingsState.error(String error) = _Error;
}
