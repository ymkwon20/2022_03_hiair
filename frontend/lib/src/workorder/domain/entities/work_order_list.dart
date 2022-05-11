import 'package:frontend/src/workorder/domain/entities/work_order.dart';

class WorkOrderList {
  final bool isNextAvailable;
  final List<WorkOrder> items;

  const WorkOrderList({
    required this.isNextAvailable,
    required this.items,
  });

  WorkOrderList copyWith({
    bool? isNextAvailable,
    List<WorkOrder>? items,
  }) {
    return WorkOrderList(
      isNextAvailable: isNextAvailable ?? this.isNextAvailable,
      items: items ?? this.items,
    );
  }
}
