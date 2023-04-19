import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';
import 'package:frontend/src/workorderCurrent/domain/entities/current_work_order.dart';

class CurrentWorkOrderLoadedRow extends CustomTableRow {
  CurrentWorkOrderLoadedRow({
    required CurrentWorkOrder order,
    Color? color,
    TextStyle style = const TextStyle(
      fontSize: 20,
    ),
  }) : super(
          contents: [
            Text(
              order.pjtNo,
              style: style,
            ),
            Text(
              order.pndDate,
              style: style,
            ),
            Text(
              order.wonb,
              style: style,
            ),
            Text(
              order.wbNm,
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
              order.wcNm,
              style: style,
            ),
          ],
          color: color ?? Colors.transparent,
        );
}
