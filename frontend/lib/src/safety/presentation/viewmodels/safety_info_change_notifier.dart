import 'package:flutter/material.dart';
import 'package:frontend/src/safety/domain/entities/safety_info.dart';

class SafetyInfoChangeNotifier with ChangeNotifier {
  late String code;
  final items = <SafetyInfo>[];

  final Map<String, bool> sortedColumn = <String, bool>{};
  final Map<String, Set<String>> filterMap = {};

  void setCode(String newCode) {
    code = newCode;
  }

  void setItems(List<SafetyInfo> newItems) {
    items.clear();
    items.addAll(newItems);
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

    // switch (tertiary) {
    //   case 0:
    //     sortedColumn.remove(key);
    //     break;
    //   case 1:
    //     sortedColumn.addAll({key: true});
    //     break;
    //   case 2:
    //     sortedColumn.addAll({key: false});
    //     break;
    // }

    items.sort((a, b) {
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
