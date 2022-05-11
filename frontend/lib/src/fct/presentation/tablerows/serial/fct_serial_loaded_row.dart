import 'package:flutter/material.dart';
import 'package:frontend/src/workorder/presentation/screens/custom_table.dart';

class FctSerialLoadedRow extends CustomTableRow {
  FctSerialLoadedRow({
    required String serial,
    Color? color,
  }) : super(
          contents: [
            Text(serial),
          ],
          color: color ?? Colors.transparent,
        );
}
