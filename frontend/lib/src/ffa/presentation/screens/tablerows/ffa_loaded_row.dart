import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';

class FFALoadedRow extends CustomTableRow {
  FFALoadedRow({
    required WorkOrder order,
    Color? color,
    TextStyle style = const TextStyle(
      fontSize: 20,
    ),
  }) : super(
          contents: [
            Text(
              order.chkTblDT,
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
              order.itemSpec,
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
              order.pndDate,
              style: style,
            ),
            Text(
              order.chkSchDT,
              style: style,
            ),
          ],
          color: color ?? Colors.transparent,
        );
}
