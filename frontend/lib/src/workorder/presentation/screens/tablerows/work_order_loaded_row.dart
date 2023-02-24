import 'package:flutter/material.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';

class WorkOrderLoadedRow extends CustomTableRow {
  WorkOrderLoadedRow({
    required WorkOrder order,
    Color? color,
    TextStyle style = const TextStyle(
      fontSize: 20,
    ),
  }) : super(
          contents: [
            Text(
              order.wbNm,
              style: style,
            ),
            Text(
              order.statusKr,
              style: style,
            ),
            Text(
              order.yard,
              style: style,
            ),
            Text(
              order.hullNo,
              style: style,
            ),
            Text(
              order.ship,
              style: style,
            ),
            Text(
              order.sysNo,
              style: style,
            ),
            Text(
              order.itemNo,
              style: style,
            ),
            Text(
              "${order.qty}",
              style: style,
            ),
          ],
          color: color ?? Colors.transparent,
        );
}
