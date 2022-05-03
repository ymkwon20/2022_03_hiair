import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_check.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_check_result.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_serial.dart';

part 'cutting_check_save_event.freezed.dart';

@freezed
class CuttingCheckSaveEvent with _$CuttingCheckSaveEvent {
  const CuttingCheckSaveEvent._();
  const factory CuttingCheckSaveEvent.save(
          CuttingSerial serial, CuttingCheck check, CuttingCheckResult result) =
      _Saving;
}
