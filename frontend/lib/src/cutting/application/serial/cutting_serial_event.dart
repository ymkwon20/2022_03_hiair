import 'package:freezed_annotation/freezed_annotation.dart';

part 'cutting_serial_event.freezed.dart';

@freezed
class CuttingSerialEvent with _$CuttingSerialEvent {
  const CuttingSerialEvent._();
  const factory CuttingSerialEvent.getSerials() = _GetSerials;
}
