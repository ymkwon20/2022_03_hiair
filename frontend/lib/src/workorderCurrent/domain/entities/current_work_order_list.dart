import 'package:frontend/src/workorderCurrent/domain/entities/current_work_order.dart';

class CurrentWorkOrderList {
  final List<CurrentWorkOrder> items;

  const CurrentWorkOrderList({
    required this.items,
  });

  CurrentWorkOrderList copyWith({
    List<CurrentWorkOrder>? items,
  }) {
    return CurrentWorkOrderList(
      items: items ?? this.items,
    );
  }
}
