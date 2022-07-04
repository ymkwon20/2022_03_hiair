import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';

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
            )
          ],
          color: color ?? Colors.transparent,
        );
}
