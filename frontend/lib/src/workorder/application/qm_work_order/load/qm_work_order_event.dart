import 'package:freezed_annotation/freezed_annotation.dart';

part 'qm_work_order_event.freezed.dart';

@freezed
class QmWorkOrderEvent with _$QmWorkOrderEvent {
  const QmWorkOrderEvent._();
  const factory QmWorkOrderEvent.fetchListByPage() = _FetchListByPage;
}
