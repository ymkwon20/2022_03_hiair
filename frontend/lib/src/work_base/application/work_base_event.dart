import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_base_event.freezed.dart';

@freezed
class WorkBaseEvent with _$WorkBaseEvent {
  const WorkBaseEvent._();
  const factory WorkBaseEvent.fetchWorkBases() = _FetchWorkBases;
}
