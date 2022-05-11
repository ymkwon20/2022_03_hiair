import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/checklist/domain/entities/check_item.dart';

part 'checklist_state.freezed.dart';

@freezed
class ChecklistState with _$ChecklistState {
  const ChecklistState._();
  const factory ChecklistState.initial() = _Initial;
  const factory ChecklistState.loading() = _Loading;
  const factory ChecklistState.loaded(List<CheckItem> checklist) = _Loaded;
  const factory ChecklistState.failure(String message) = _Failure;
}
