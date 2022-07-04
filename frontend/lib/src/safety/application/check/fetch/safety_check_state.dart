import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/safety/domain/entities/safety_check.dart';

part 'safety_check_state.freezed.dart';

@freezed
class SafetyCheckState with _$SafetyCheckState {
  const SafetyCheckState._();
  const factory SafetyCheckState.init() = _Init;
  const factory SafetyCheckState.loading() = _Loading;
  const factory SafetyCheckState.loaded(List<SafetyCheck> items) = _Loaded;
  const factory SafetyCheckState.failure(String msg) = _Failure;
}
