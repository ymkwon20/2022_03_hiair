import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/qm/application/save/qm_save_event.dart';

part 'qm_save_state.freezed.dart';

@freezed
class QmSaveState with _$QmSaveState {
  const QmSaveState._();
  const factory QmSaveState.none() = _None;
  const factory QmSaveState.saving() = _Saving;
  const factory QmSaveState.oneSaved(int index, String date, QmStatus status) =
      _Saved;
  const factory QmSaveState.multipleSaved(
      List<int> indice, String date, QmStatus status) = _MultipleSaved;
  const factory QmSaveState.failure(String message) = _Failure;
}
