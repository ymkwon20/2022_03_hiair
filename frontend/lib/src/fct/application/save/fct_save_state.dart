import 'package:freezed_annotation/freezed_annotation.dart';
part 'fct_save_state.freezed.dart';

@freezed
class FctSaveState with _$FctSaveState {
  const FctSaveState._();
  const factory FctSaveState.init() = _Init;
  const factory FctSaveState.saving() = _Saving;
  const factory FctSaveState.saved() = _Saved;
  const factory FctSaveState.failure(String message) = _Failure;
}
