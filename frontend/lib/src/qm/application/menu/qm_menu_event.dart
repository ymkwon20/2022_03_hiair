import 'package:freezed_annotation/freezed_annotation.dart';

part 'qm_menu_event.freezed.dart';

@freezed
class QmMenuEvent with _$QmMenuEvent {
  const QmMenuEvent._();
  const factory QmMenuEvent.fetchQmMenulist() = _FetchQmMenulist;
}
