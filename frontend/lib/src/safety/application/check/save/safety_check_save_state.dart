import 'package:freezed_annotation/freezed_annotation.dart';

part 'safety_check_save_state.freezed.dart';

@freezed
class SafetyCheckSaveState with _$SafetyCheckSaveState {
  const SafetyCheckSaveState._();
  const factory SafetyCheckSaveState.init() = _Init;
  const factory SafetyCheckSaveState.saving() = _Saving;
  const factory SafetyCheckSaveState.saved() = _Saved;
  const factory SafetyCheckSaveState.failure(String msg) = _Failure;
}
