import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/impeller/domain/entities/impeller.dart';

part 'impeller_save_event.freezed.dart';

enum ImpellerSaveStatus {
  start,
  startCancel,
  end,
  all,
}

@freezed
class ImpellerSaveEvent with _$ImpellerSaveEvent {
  const ImpellerSaveEvent._();
  const factory ImpellerSaveEvent.saveImpeller(
      Impeller item, ImpellerSaveStatus status, int index) = _SaveImpeller;
  const factory ImpellerSaveEvent.saveImpellerList(
          List<Impeller> list, ImpellerSaveStatus status, List<int> indice) =
      _SaveImpellerList;
  const factory ImpellerSaveEvent.resetToNone() = _ResetToNone;
}
