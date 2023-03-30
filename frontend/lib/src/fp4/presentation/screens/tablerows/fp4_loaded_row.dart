import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';

class FP4LoadedRow extends CustomTableRow {
  FP4LoadedRow({
    required WorkOrder order,
    Color? color,
    TextStyle style = const TextStyle(
      fontSize: 20,
    ),
  }) : super(
          contents: [
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
              order.itemSpec,
              style: style,
            ),
            Text(
              order.size,
              style: style,
            ),
            Text(
              order.inside,
              style: style,
            ),
            Text(
              order.inDomar,
              style: style,
            ),
            Text(
              order.outside,
              style: style,
            ),
            Text(
              order.outDomar,
              style: style,
            ),
            Text(
              order.material,
              style: style,
            ),
            Text(
              order.befCloseDT,
              style: style,
            ),
            Text(
              order.pndDate,
              style: style,
            ),
            Text(
              order.chkSchDT,
              style: style,
            ),
            Text(
              order.qty.toString(),
              style: style,
            ),
            Text(
              order.weight,
              style: style,
            ),
          ],
          color: color ?? Colors.transparent,
        );
}
