import 'package:freezed_annotation/freezed_annotation.dart';

part 'safety_repair_save_state.freezed.dart';

@freezed
class SafetyRepairSaveState with _$SafetyRepairSaveState {
  const SafetyRepairSaveState._();
  const factory SafetyRepairSaveState.none() = _None;
  const factory SafetyRepairSaveState.saving() = _Saving;
  const factory SafetyRepairSaveState.saved() = _Saved;
  const factory SafetyRepairSaveState.failure(String message) = _Failure;
}
