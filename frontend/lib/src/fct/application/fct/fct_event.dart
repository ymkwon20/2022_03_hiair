import 'package:freezed_annotation/freezed_annotation.dart';

part 'fct_event.freezed.dart';

@freezed
class FctEvent with _$FctEvent {
  const FctEvent._();
  const factory FctEvent.getFctItems(String serial) = _GetFctItems;
}
