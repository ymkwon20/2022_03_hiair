import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/widgets/custom_table.dart';

class TableLoadingRow extends CustomTableRow {
  TableLoadingRow()
      : super(
          contents: List.generate(
            20,
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
