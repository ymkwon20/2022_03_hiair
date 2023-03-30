import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';

class FWPLoadedRow extends CustomTableRow {
  FWPLoadedRow({
    required WorkOrder order,
    Color? color,
    TextStyle style = const TextStyle(
      fontSize: 20,
    ),
  }) : super(
          contents: [
            Text(
              order.chkSchDT,
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
              order.size,
              style: style,
            ),
            Text(
              order.swingTypeNM,
              style: style,
            ),
            Text(
              order.frame,
              style: style,
            ),
            Text(
              order.wonb,
              style: style,
            ),
            Text(
              order.pndDate,
              style: style,
            ),
            Text(
              order.material,
              style: style,
            ),
            Text(
              order.wbNm,
              style: style,
            ),
            Text(
              order.cfmDate,
              style: style,
            ),
            Text(
              order.motorColor,
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
