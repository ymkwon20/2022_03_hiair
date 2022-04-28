import 'package:flutter/material.dart';
import 'package:frontend/src/core/constants/index.dart';
import 'package:frontend/src/qm/presentation/screens/custom_table.dart';

class FctSerialLoadingRow extends CustomTableRow {
  FctSerialLoadingRow()
      : super(
          contents: List.generate(
            1,
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
