import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/checklist/domain/entities/check_item.dart';

part 'checklist_save_event.freezed.dart';

@freezed
class ChecklistSaveEvent with _$ChecklistSaveEvent {
  const ChecklistSaveEvent._();
  const factory ChecklistSaveEvent.saveChecklist(List<CheckItem> items) =
      _SaveCheckItem;
}
