import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';
import 'package:frontend/src/impeller/domain/entities/impeller.dart';

class ImpellerSingleLoadedRow extends CustomTableRow {
  ImpellerSingleLoadedRow({
    required Impeller order,
    Color? color,
    TextStyle style = const TextStyle(
      fontSize: 20,
    ),
  }) : super(
          contents: [
            Text(
              order.code,
              style: style,
            ),
            Text(
              order.partNo,
              style: style,
            ),
            Text(
              order.qty.toString(),
              style: style,
            ),
            Text(
              order.shaft,
              style: style,
            ),
            Text(
              order.bldType,
              style: style,
            ),
            Text(
              order.fanType,
              style: style,
            ),
            Text(
              order.bldQTY,
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
