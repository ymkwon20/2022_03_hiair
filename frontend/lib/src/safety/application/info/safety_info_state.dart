import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/safety/domain/entities/safety_info.dart';

part 'safety_info_state.freezed.dart';

@freezed
class SafetyInfoState with _$SafetyInfoState {
  const SafetyInfoState._();
  const factory SafetyInfoState.init() = _Init;
  const factory SafetyInfoState.loading() = _Loading;
  const factory SafetyInfoState.loaded(List<SafetyInfo> items) = _Loaded;
  const factory SafetyInfoState.failure(String msg) = _Failure;
}
