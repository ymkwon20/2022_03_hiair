import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';

part 'work_order_state.freezed.dart';

@freezed
class WorkOrderState with _$WorkOrderState {
  const WorkOrderState._();
  const factory WorkOrderState.initial(List<WorkOrder> items) = _Initial;
  const factory WorkOrderState.loading(
      List<WorkOrder> items, int itemsPerPage) = _Loading;
  const factory WorkOrderState.loaded(
      List<WorkOrder> items, bool isNextPageAvailable) = _Loaded;
  const factory WorkOrderState.failure(List<WorkOrder> items, String message) =
      _Failure;
}
