import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';

part 'work_order_save_event.freezed.dart';

enum WorkOrderStatus {
  start,
  end,
}

@freezed
class WorkOrderSaveEvent with _$WorkOrderSaveEvent {
  const WorkOrderSaveEvent._();
  const factory WorkOrderSaveEvent.saveWorkOrder(
      WorkOrder item, WorkOrderStatus status, int index) = _SaveWorkOrder;
  const factory WorkOrderSaveEvent.saveWorkOrderList(
          List<WorkOrder> list, WorkOrderStatus status, List<int> indice) =
      _SaveWorkOrderList;
  const factory WorkOrderSaveEvent.resetToNone() = _ResetToNone;
}
