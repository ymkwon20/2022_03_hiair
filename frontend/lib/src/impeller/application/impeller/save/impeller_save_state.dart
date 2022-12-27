import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/impeller/application/impeller/save/impeller_save_event.dart';

part 'impeller_save_state.freezed.dart';

@freezed
class ImpellerSaveState with _$ImpellerSaveState {
  const ImpellerSaveState._();
  const factory ImpellerSaveState.none() = _None;
  const factory ImpellerSaveState.saving() = _Saving;
  const factory ImpellerSaveState.oneSaved(
      int index, String date, ImpellerSaveStatus status) = _Saved;
  const factory ImpellerSaveState.multipleSaved(
          List<int> indice, String date, ImpellerSaveStatus status) =
      _MultipleSaved;
  const factory ImpellerSaveState.failure(String message) = _Failure;
}
