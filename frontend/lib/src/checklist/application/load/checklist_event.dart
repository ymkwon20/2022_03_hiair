import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_check.dart';
import 'package:frontend/src/workorder/domain/entities/i_work_order.dart';

part 'checklist_event.freezed.dart';

@freezed
class ChecklistEvent with _$ChecklistEvent {
  const ChecklistEvent._();
  const factory ChecklistEvent.clear() = _Clear;
  const factory ChecklistEvent.fetchChecklist(IWorkOrder order, String code) =
      _FetchChecklist;
  const factory ChecklistEvent.fetchCheckimagelist(IWorkOrder order) =
      _FetchCheckimagelist;
  const factory ChecklistEvent.fetchChecklistForCut(CuttingCheck order) =
      _FetchChecklistForCut;
  const factory ChecklistEvent.fetchChecklistForWorkOrder(IWorkOrder order) =
      _FetchChecklistForWorkOrder;
}
