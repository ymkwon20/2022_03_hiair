import 'package:flutter/foundation.dart';
import 'package:frontend/src/workorder/domain/entities/qm_work_order.dart';

class QmWorkOrderList {
  final bool isNextAvailable;
  final List<QmWorkOrder> items;

  const QmWorkOrderList({
    required this.isNextAvailable,
    required this.items,
  });

  QmWorkOrderList copyWith({
    bool? isNextAvailable,
    List<QmWorkOrder>? items,
  }) {
    return QmWorkOrderList(
      isNextAvailable: isNextAvailable ?? this.isNextAvailable,
      items: items ?? this.items,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QmWorkOrderList &&
        other.isNextAvailable == isNextAvailable &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode => isNextAvailable.hashCode ^ items.hashCode;
}
