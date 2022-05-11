import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';

import 'package:frontend/src/workorder/presentation/screens/custom_table.dart';

class WorkOrderFailureRow extends CustomTableRow {
  final String message;
  WorkOrderFailureRow({
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
