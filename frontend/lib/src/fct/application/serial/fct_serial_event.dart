import 'package:freezed_annotation/freezed_annotation.dart';

part 'fct_serial_event.freezed.dart';

@freezed
class FctSerialEvent with _$FctSerialEvent {
  const FctSerialEvent._();
  const factory FctSerialEvent.getFctSerials() = _FctSerials;
}
