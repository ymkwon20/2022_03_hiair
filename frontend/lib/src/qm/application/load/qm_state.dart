import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/qm/domain/entities/qm_item.dart';

part 'qm_state.freezed.dart';

@freezed
class QmState with _$QmState {
  const QmState._();
  const factory QmState.initial(List<QmItem> items) = _Initial;
  const factory QmState.loading(List<QmItem> items, int itemsPerPage) =
      _Loading;
  const factory QmState.loaded(List<QmItem> items) = _Loaded;
  const factory QmState.failure(List<QmItem> items, String message) = _Failure;
}
