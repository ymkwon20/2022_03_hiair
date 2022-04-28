import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_serial.dart';

part 'cutting_check_event.freezed.dart';

@freezed
class CuttingCheckEvent with _$CuttingCheckEvent {
  const CuttingCheckEvent._();
  const factory CuttingCheckEvent.fetchChecks(CuttingSerial serial) =
      _FetchChecks;
}
