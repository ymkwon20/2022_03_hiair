import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/work_base/domain/entities/work_base_info.dart';

part 'work_base_state.freezed.dart';

@freezed
class WorkBaseState with _$WorkBaseState {
  const WorkBaseState._();
  const factory WorkBaseState.init() = _Init;
  const factory WorkBaseState.loading() = _Loading;
  const factory WorkBaseState.loaded(List<WorkBaseInfo> items) = _Loaded;
  const factory WorkBaseState.failure(String message) = _Failure;
}
