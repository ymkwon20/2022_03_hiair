import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_event.freezed.dart';

@freezed
class ChecklistEvent with _$ChecklistEvent {
  const ChecklistEvent._();
  const factory ChecklistEvent.fetchChecklist(Map<String, dynamic> params) =
      _FetchChecklist;
}
