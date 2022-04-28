import 'package:flutter/material.dart';
import 'package:frontend/src/qm/domain/entities/qm_item.dart';
import 'package:frontend/src/qm/presentation/screens/custom_table.dart';

class QmLoadedRow extends CustomTableRow {
  QmLoadedRow({required QmItem qmItem, Color? color})
      : super(
          contents: [
            Text(qmItem.workOrder),
            Text(qmItem.datePlanned),
            Text(qmItem.yard),
            Text(qmItem.hullNo),
            Text(qmItem.ship),
            Text(qmItem.sysNo),
            Text(qmItem.itemNo),
            Text("${qmItem.qty}"),
          ],
          color: color ?? Colors.transparent,
        );
}
