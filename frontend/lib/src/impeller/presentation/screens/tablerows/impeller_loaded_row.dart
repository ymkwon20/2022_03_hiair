import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';
import 'package:frontend/src/impeller/domain/entities/impeller.dart';

class ImpellerLoadedRow extends CustomTableRow {
  ImpellerLoadedRow({
    required Impeller order,
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
              order.itemNo,
              style: style,
            ),
            Text(
              order.bldAngle,
              style: style,
            ),
            Text(
              order.shaft,
              style: style,
            ),
            Text(
              order.rmk,
              style: style,
            ),
            Text(
              order.wbNm,
              style: style,
            ),
            Text(
              order.statusKr,
              style: style,
            ),
          ],
          color: color ?? Colors.transparent,
        );
}
