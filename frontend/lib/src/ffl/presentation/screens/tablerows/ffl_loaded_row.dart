import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';

class FFLLoadedRow extends CustomTableRow {
  FFLLoadedRow({
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
              order.pndDate,
              style: style,
            ),
            Text(
              order.workwcnm,
              style: style,
            ),
            Text(
              order.qty.toString(),
              style: style,
            ),
            Text(
              order.ironPlateThickness.toString(),
              style: style,
            ),
            Text(
              order.ironPlateWidth,
              style: style,
            ),
            Text(
              order.ironPlateHeight,
              style: style,
            ),
            Text(
              order.hollUpDown,
              style: style,
            ),
            Text(
              order.rmk,
              style: style,
            ),
          ],
          color: color ?? Colors.transparent,
        );
}
