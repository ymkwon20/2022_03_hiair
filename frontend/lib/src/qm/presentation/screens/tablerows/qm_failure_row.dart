import 'package:flutter/material.dart';
import 'package:frontend/src/core/constants/index.dart';

import 'package:frontend/src/qm/presentation/screens/custom_table.dart';

class FailureRow extends CustomTableRow {
  final String message;
  FailureRow({
    required this.message,
  }) : super(
          child: Text(
            message,
            style: const TextStyle(
              color: ThemeConstant.errorColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
}
