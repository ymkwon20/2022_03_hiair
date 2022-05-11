import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_save_state.freezed.dart';

@freezed
class ChecklistSaveState with _$ChecklistSaveState {
  const ChecklistSaveState._();
  const factory ChecklistSaveState.init() = _Init;
  const factory ChecklistSaveState.saving() = _Saving;
  const factory ChecklistSaveState.saved() = _Saved;
  const factory ChecklistSaveState.failure(String message) = _Failure;
}
