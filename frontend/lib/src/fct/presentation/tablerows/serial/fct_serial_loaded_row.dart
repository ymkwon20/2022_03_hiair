import 'package:flutter/material.dart';
import 'package:frontend/src/workorder/presentation/screens/custom_table.dart';

class FctSerialLoadedRow extends CustomTableRow {
  FctSerialLoadedRow({
    required String serial,
    Color? color,
    TextStyle style = const TextStyle(
      fontSize: 20,
    ),
  }) : super(
          contents: [
            Text(
              serial,
              style: style,
            ),
          ],
          color: color ?? Colors.transparent,
        );
}
