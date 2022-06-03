import 'package:flutter/material.dart';
import 'package:frontend/src/fct/domain/entities/fct.dart';
import 'package:frontend/src/workorder/presentation/screens/custom_table.dart';

class FctLoadedRow extends CustomTableRow {
  FctLoadedRow({
    required Fct fct,
    Color? color,
    TextStyle style = const TextStyle(
      fontSize: 20,
    ),
  }) : super(
          contents: [
            Text(
              fct.thickness.toString(),
              style: style,
            ),
            Text(
              fct.width.toString(),
              style: style,
            ),
            Text(
              fct.length.toString(),
              style: style,
            ),
            Text(
              fct.cutQty.toString(),
              style: style,
            ),
            Text(
              fct.panQty.toString(),
              style: style,
            ),
            Text(
              fct.remark.toString(),
              overflow: TextOverflow.ellipsis,
              style: style,
            ),
          ],
          color: color ?? Colors.transparent,
        );
}
