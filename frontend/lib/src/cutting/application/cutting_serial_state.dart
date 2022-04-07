import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_serial.dart';

part 'cutting_serial_state.freezed.dart';

@freezed
class CuttingSerialState with _$CuttingSerialState {
  const CuttingSerialState._();
  const factory CuttingSerialState.initial() = _Initial;
  const factory CuttingSerialState.loading() = _Loading;
  const factory CuttingSerialState.loaded(List<CuttingSerial> data) = _Loaded;
  const factory CuttingSerialState.failure(String message) = _Failure;
}
