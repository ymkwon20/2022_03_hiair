import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/workorder/presentation/screens/custom_table.dart';

class WorkOrderLoadingRow extends CustomTableRow {
  WorkOrderLoadingRow()
      : super(
          contents: List.generate(
            8,
            (index) => Container(
              height: LayoutConstant.spaceL,
              padding: const EdgeInsets.symmetric(
                  horizontal: LayoutConstant.paddingM),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(LayoutConstant.radiusL),
                color: ThemeConstant.complementaryColor,
              ),
            ),
          ),
        );
}
