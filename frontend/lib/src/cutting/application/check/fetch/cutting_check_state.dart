import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_check.dart';

part 'cutting_check_state.freezed.dart';

@freezed
class CuttingCheckState with _$CuttingCheckState {
  const CuttingCheckState._();
  const factory CuttingCheckState.initial() = _Initial;
  const factory CuttingCheckState.loading() = _Loading;
  const factory CuttingCheckState.loaded(List<CuttingCheck> checks) = _Loaded;
  const factory CuttingCheckState.failure(String message) = _Failure;
}
