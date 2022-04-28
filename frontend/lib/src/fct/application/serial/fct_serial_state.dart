import 'package:freezed_annotation/freezed_annotation.dart';

part 'fct_serial_state.freezed.dart';

@freezed
class FctSerailState with _$FctSerailState {
  const FctSerailState._();
  const factory FctSerailState.init() = _Init;
  const factory FctSerailState.loading() = _Loading;
  const factory FctSerailState.loaded(List<String> serials) = _Loaded;
  const factory FctSerailState.failure(String message) = _Failure;
}
