import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';
import 'package:frontend/src/safety/domain/entities/safety_info.dart';

class SafetyInfoLoadedRow extends CustomTableRow {
  SafetyInfoLoadedRow({
    required SafetyInfo info,
    Color? color,
    TextStyle style = const TextStyle(
      fontSize: 20,
    ),
  }) : super(
          contents: [
            Text(
              info.plantNm,
              style: style,
            ),
            Text(
              info.equipCd,
              style: style,
            ),
            Text(
              info.equipNm,
              style: style,
            ),
            Text(
              info.type,
              style: style,
            ),
            Text(
              info.location,
              style: style,
            ),
          ],
          color: color ?? Colors.transparent,
        );
}
