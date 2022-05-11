import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';

part 'checklist_event.freezed.dart';

@freezed
class ChecklistEvent with _$ChecklistEvent {
  const ChecklistEvent._();
  const factory ChecklistEvent.fetchChecklist(WorkOrder order) =
      _FetchChecklist;
}
