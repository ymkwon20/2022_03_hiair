import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';
import 'package:frontend/src/safety/domain/entities/safety_check.dart';

class SafetyCheckLoadedRow extends CustomTableRow {
  SafetyCheckLoadedRow({
    required SafetyCheck check,
    Color? color,
    ValueChanged<int>? onCellTap,
    TextStyle style = const TextStyle(
      fontSize: 20,
    ),
  }) : super(
          contents: [
            Text(
              check.checkNm,
              style: style,
            ),
            Text(
              check.checkStandardNm,
              style: style,
            ),
            Text(
              check.checkCycle,
              style: style,
            ),
            Text(
              check.data,
              style: style,
            ),
            Text(
              check.remark,
              style: style,
            ),
          ],
          color: color ?? Colors.transparent,
          onCellTap: onCellTap,
        );
}
