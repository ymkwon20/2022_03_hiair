import 'package:flutter/material.dart';
import 'package:frontend/src/fct/domain/entities/fct.dart';
import 'package:frontend/src/qm/presentation/screens/custom_table.dart';

class FctLoadedRow extends CustomTableRow {
  FctLoadedRow({
    required Fct fct,
    Color? color,
  }) : super(
          contents: [
            Text(fct.thickness.toString()),
            Text(fct.width.toString()),
            Text(fct.length.toString()),
            Text(fct.cutQty.toString()),
            Text(fct.panQty.toString()),
            Text(
              fct.remark.toString(),
              overflow: TextOverflow.ellipsis,
            ),
          ],
          color: color ?? Colors.transparent,
        );
}
