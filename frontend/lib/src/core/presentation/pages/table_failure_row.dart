import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';

import 'package:frontend/src/core/presentation/widgets/custom_table.dart';

class TableFailureRow extends CustomTableRow {
  final String message;
  TableFailureRow({
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
