import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/qm/domain/entities/qm_item.dart';

part 'qm_save_event.freezed.dart';

enum QmStatus {
  start,
  end,
}

@freezed
class QmSaveEvent with _$QmSaveEvent {
  const QmSaveEvent._();
  const factory QmSaveEvent.saveQmItem(
      QmItem item, QmStatus status, int index) = _SaveQmItem;
  const factory QmSaveEvent.saveQmList(
      List<QmItem> list, QmStatus status, List<int> indice) = _SaveQmList;
  const factory QmSaveEvent.resetToNone() = _ResetToNone;
}
