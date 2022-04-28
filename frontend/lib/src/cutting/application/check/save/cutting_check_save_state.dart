import 'package:freezed_annotation/freezed_annotation.dart';

part 'cutting_check_save_state.freezed.dart';

@freezed
class CuttingCheckSaveState with _$CuttingCheckSaveState {
  const CuttingCheckSaveState._();
  const factory CuttingCheckSaveState.initial() = _Initial;
  const factory CuttingCheckSaveState.saving() = _Saving;
  const factory CuttingCheckSaveState.saved() = _Saved;
  const factory CuttingCheckSaveState.failure(String message) = _Failure;
}
