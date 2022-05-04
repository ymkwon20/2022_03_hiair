import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/qm/domain/entities/qm_item.dart';

part 'qm_event.freezed.dart';

@freezed
class QmEvent with _$QmEvent {
  const QmEvent._();
  const factory QmEvent.fetchQmItemsByPage(List<QmItem> items, int page) =
      _FetchQmItems;
}
