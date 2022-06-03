import 'package:flutter/material.dart';

import 'package:frontend/src/fct/domain/entities/fct.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final fctChangeNotifierProvider = ChangeNotifierProvider<FctChangeNotifier>(
  (ref) => FctChangeNotifier(items: []),
);

class FctChangeNotifier with ChangeNotifier {
  final List<Fct> items;
  FctChangeNotifier({
    required this.items,
  });

  void setItems(List<Fct> newItems) {
    items.clear();
    items.addAll(newItems);
    notifyListeners();
  }

  void setValue(int index, Fct item) {
    items[index] = item;
    notifyListeners();
  }
}
