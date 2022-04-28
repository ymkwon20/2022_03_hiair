import 'package:flutter/material.dart';
import 'package:frontend/src/core/constants/index.dart';
import 'package:frontend/src/qm/presentation/screens/custom_table.dart';

class QmLoadingRow extends CustomTableRow {
  QmLoadingRow()
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
