import 'package:flutter/material.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';
import 'package:frontend/src/workorder/presentation/screens/custom_table.dart';

class WorkOrderLoadedRow extends CustomTableRow {
  WorkOrderLoadedRow({required WorkOrder order, Color? color})
      : super(
          contents: [
            Text(order.code),
            Text(order.datePlanned),
            Text(order.yard),
            Text(order.hullNo),
            Text(order.ship),
            Text(order.sysNo),
            Text(order.itemNo),
            Text("${order.qty}"),
          ],
          color: color ?? Colors.transparent,
        );
}
