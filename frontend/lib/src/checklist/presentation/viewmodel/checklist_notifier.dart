import 'package:flutter/material.dart';
import 'package:frontend/src/checklist/domain/entities/check_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final checkItemProvider = Provider<CheckItem>(
  (ref) => throw UnimplementedError(),
);

final checkIndexProvider = Provider<int>(
  (ref) => throw UnimplementedError(),
);

final checklistNotifierProvider = ChangeNotifierProvider(
  (ref) => ChecklistNotifier(),
);

class ChecklistNotifier extends ChangeNotifier {
  List<CheckItem> items = [];

  void setChecklist(List<CheckItem> value) {
    items = value;
    notifyListeners();
  }

  void editCheckItem(int index, CheckItem value) {
    items[index] = value;
    notifyListeners();
  }

  void clear() {
    items.clear();
    notifyListeners();
  }

  bool get isNotCompleted => items.any((item) => !item.hasValue);

  bool get isCompleted => !isNotCompleted;
}
