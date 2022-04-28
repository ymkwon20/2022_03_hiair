import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/fct/domain/entities/fct.dart';

part 'fct_save_event.freezed.dart';

@freezed
class FctSaveEvent with _$FctSaveEvent {
  const FctSaveEvent._();
  const factory FctSaveEvent.saveFctItem(List<Fct> items) = _SaveFctItem;
}
