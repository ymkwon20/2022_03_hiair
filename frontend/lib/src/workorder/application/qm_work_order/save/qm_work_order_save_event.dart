import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/workorder/domain/entities/qm_work_order.dart';

part 'qm_work_order_save_event.freezed.dart';

@freezed
class QmWorkOrderSaveEvent with _$QmWorkOrderSaveEvent {
  const QmWorkOrderSaveEvent._();
  const factory QmWorkOrderSaveEvent.saveQmWorkOrder(
      QmWorkOrder item, int index) = _SaveQmWorkOrder;
  const factory QmWorkOrderSaveEvent.saveQmWorkOrderList(
      List<QmWorkOrder> list, List<int> indice) = _SaveQmWorkOrderList;
  const factory QmWorkOrderSaveEvent.resetToNone() = _ResetToNone;
}
