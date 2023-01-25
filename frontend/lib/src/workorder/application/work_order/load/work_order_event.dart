import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';

part 'work_order_event.freezed.dart';

@freezed
class WorkOrderEvent with _$WorkOrderEvent {
  const WorkOrderEvent._();
  const factory WorkOrderEvent.fetchListByPage(
      List<WorkOrder> items, int page) = _FetchListByPage;
  const factory WorkOrderEvent.searchByYardHullNo(
          List<WorkOrder> items, int page, String yard, String hullNo) =
      _SearchByYardHullNo;
}
