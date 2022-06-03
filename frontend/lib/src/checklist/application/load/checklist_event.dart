import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_check.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';

part 'checklist_event.freezed.dart';

@freezed
class ChecklistEvent with _$ChecklistEvent {
  const ChecklistEvent._();
  const factory ChecklistEvent.clear() = _Clear;
  const factory ChecklistEvent.fetchChecklist(WorkOrder order, String code) =
      _FetchChecklist;
  const factory ChecklistEvent.fetchCheckimagelist(WorkOrder order) =
      _FetchCheckimagelist;
  const factory ChecklistEvent.fetchChecklistForCut(CuttingCheck order) =
      _FetchChecklistForCut;
}
