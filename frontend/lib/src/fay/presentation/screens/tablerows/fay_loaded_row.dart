import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';

class FAYLoadedRow extends CustomTableRow {
  FAYLoadedRow({
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
              order.pndDate,
              style: style,
            ),
            Text(
              order.mtrOutDT,
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
              order.fanType,
              style: style,
            ),
            Text(
              order.itemSpec,
              style: style,
            ),
            Text(
              order.motorColor,
              style: style,
            ),
            Text(
              order.outDomar,
              style: style,
            ),
            Text(
              order.wbNm,
              style: style,
            ),
            Text(
              order.custltemName,
              style: style,
            ),
            Text(
              order.wonb,
              style: style,
            ),
          ],
          color: color ?? Colors.transparent,
        );
}
