import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/fct/domain/entities/fct.dart';

part 'fct_state.freezed.dart';

@freezed
class FctState with _$FctState {
  const FctState._();
  const factory FctState.init() = _Init;
  const factory FctState.loading() = _Loading;
  const factory FctState.loaded(List<Fct> items) = _Loaded;
  const factory FctState.failure(String message) = _Failure;
}
