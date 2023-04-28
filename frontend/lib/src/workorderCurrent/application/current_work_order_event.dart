import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/workorderCurrent/domain/entities/current_work_order.dart';

part 'current_work_order_event.freezed.dart';

@freezed
class CurrentWorkOrderEvent with _$CurrentWorkOrderEvent {
  const CurrentWorkOrderEvent._();
  const factory CurrentWorkOrderEvent.fetchCurrentWorkOrder(
          List<CurrentWorkOrder> items, String yard, String hullNo) =
      _FetchCurrentWorkOrder;
}
