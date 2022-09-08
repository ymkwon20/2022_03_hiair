import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/checklist/domain/entities/check_image.dart';
import 'package:frontend/src/checklist/domain/entities/check_item.dart';
import 'package:frontend/src/workorder/application/work_order/save/work_order_save_event.dart';

part 'checklist_save_event.freezed.dart';

@freezed
class ChecklistSaveEvent with _$ChecklistSaveEvent {
  const ChecklistSaveEvent._();
  const factory ChecklistSaveEvent.saveChecklist(List<CheckItem> items) =
      _SaveCheckList;
  const factory ChecklistSaveEvent.saveImagelist(
      List<CheckImage> items, String workCode, String workSeq) = _SaveImageList;
  const factory ChecklistSaveEvent.saveChecklistAndMore(
    List<CheckItem> items,
    WorkOrderSaveStatus status,
    String workCode,
    String workSeq,
  ) = _SaveCheckItemAndMore;
}
