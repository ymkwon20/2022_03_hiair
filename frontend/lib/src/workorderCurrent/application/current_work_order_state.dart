import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/workorderCurrent/domain/entities/current_work_order.dart';

part 'current_work_order_state.freezed.dart';

@freezed
class CurrentWorkOrderState with _$CurrentWorkOrderState {
  const CurrentWorkOrderState._();
  const factory CurrentWorkOrderState.initial(List<CurrentWorkOrder> items) =
      _Initial;
  const factory CurrentWorkOrderState.loading(List<CurrentWorkOrder> items) =
      _Loading;
  const factory CurrentWorkOrderState.loaded(List<CurrentWorkOrder> items) =
      _Loaded;
  const factory CurrentWorkOrderState.failure(
      List<CurrentWorkOrder> items, String message) = _Failure;
}
