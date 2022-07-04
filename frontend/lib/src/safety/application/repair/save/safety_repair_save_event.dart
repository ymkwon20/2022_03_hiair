import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/safety/domain/entities/repair_info.dart';

part 'safety_repair_save_event.freezed.dart';

@freezed
class SafetyRepairSaveEvent with _$SafetyRepairSaveEvent {
  const SafetyRepairSaveEvent._();
  const factory SafetyRepairSaveEvent.saveSafetyRepair(RepairInfo info) =
      _SaveSafetyRepair;
}
