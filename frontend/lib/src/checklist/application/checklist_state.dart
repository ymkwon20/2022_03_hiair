import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/checklist/domain/entities/checklist.dart';

part 'checklist_state.freezed.dart';

@freezed
class ChecklistState with _$ChecklistState {
  const ChecklistState._();
  const factory ChecklistState.initial() = _Initial;
  const factory ChecklistState.loading() = _Loading;
  const factory ChecklistState.loaded(List<Checklist> checklist) = _Loaded;
  const factory ChecklistState.failure(String message) = _Failure;
}
