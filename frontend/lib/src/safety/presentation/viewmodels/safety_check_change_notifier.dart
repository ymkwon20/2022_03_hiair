import 'package:flutter/material.dart';
import 'package:frontend/src/safety/domain/entities/safety_check.dart';

class SafetyCheckChangeNotifier with ChangeNotifier {
  final _originalItems = <SafetyCheck>[];
  final _items = <SafetyCheck>[];

  final Map<String, bool> sortedColumn = <String, bool>{};
  final Map<String, Set<String>> filterMap = {};

  List<SafetyCheck> get items => _items;

  void setItems(List<SafetyCheck> newItems) {
    _originalItems.clear();
    _originalItems.addAll(newItems);

    _items.clear();
    _items.addAll(newItems);
    notifyListeners();
  }

  void setRemark(int index, String remark) {
    _items[index] = _items[index].copyWith(
      remark: remark,
      edited: true,
    );
    notifyListeners();
  }

  void setData(int index, String data) {
    _items[index] = _items[index].copyWith(
      data: data,
      edited: true,
    );
    notifyListeners();
  }

  void reset() {
    _items.clear();
    _items.addAll(_originalItems);
    notifyListeners();
  }

  void sort(String key) {
    // 추후에 따로 사용될 수 있을 여지가 있어서 저장해놓음

    var ascending = sortedColumn[key];

    if (ascending != null) {
      if (ascending) {
        sortedColumn[key] = !ascending;
      } else {
        sortedColumn.clear();
      }
    } else {
      sortedColumn.clear();
      sortedColumn.addAll({key: true});
    }

    _items.sort((a, b) {
      final ascending = sortedColumn[key];

      if (ascending != null) {
        return (ascending ? 1 : -1) *
            a.getProp(key)!.compareTo(b.getProp(key)!);
      }

      return a.getProp(key)!.compareTo(b.getProp(key)!);
    });
    notifyListeners();
  }
}
