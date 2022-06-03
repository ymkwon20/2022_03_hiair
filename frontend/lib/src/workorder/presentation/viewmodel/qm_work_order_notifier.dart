import 'package:flutter/material.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final qmWorkOrderNotifierProvider = ChangeNotifierProvider(
  (ref) => QmWorkOrderNotifier(),
);

class QmWorkOrderNotifier with ChangeNotifier {
  WorkOrder? order;

  void setWorkOrder(WorkOrder newOrder) {
    order = newOrder;
    notifyListeners();
  }
}
