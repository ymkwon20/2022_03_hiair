import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/workorder/application/work_order/save/work_order_save_event.dart';

part 'work_order_save_state.freezed.dart';

@freezed
class WorkOrderSaveState with _$WorkOrderSaveState {
  const WorkOrderSaveState._();
  const factory WorkOrderSaveState.none() = _None;
  const factory WorkOrderSaveState.saving() = _Saving;
  const factory WorkOrderSaveState.oneSaved(
      int index, String date, WorkOrderSaveStatus status) = _Saved;
  const factory WorkOrderSaveState.multipleSaved(
          List<int> indice, String date, WorkOrderSaveStatus status) =
      _MultipleSaved;
  const factory WorkOrderSaveState.failure(String message) = _Failure;
}
