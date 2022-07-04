import 'package:freezed_annotation/freezed_annotation.dart';

part 'qm_work_order_save_state.freezed.dart';

@freezed
class QmWorkOrderSaveState with _$QmWorkOrderSaveState {
  const QmWorkOrderSaveState._();
  const factory QmWorkOrderSaveState.none() = _None;
  const factory QmWorkOrderSaveState.saving() = _Saving;
  const factory QmWorkOrderSaveState.saved(int index) = _Saved;
  const factory QmWorkOrderSaveState.failure(String message) = _Failure;
}
