import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/workorder/domain/entities/qm_work_order.dart';

part 'qm_work_order_state.freezed.dart';

@freezed
class QmWorkOrderState with _$QmWorkOrderState {
  const QmWorkOrderState._();
  const factory QmWorkOrderState.initial() = _Initial;
  const factory QmWorkOrderState.loading() = _Loading;
  const factory QmWorkOrderState.loaded(
      List<QmWorkOrder> items, bool isNextPageAvailable) = _Loaded;
  const factory QmWorkOrderState.failure(String message) = _Failure;
}
