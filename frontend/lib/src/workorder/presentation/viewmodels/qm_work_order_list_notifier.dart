import 'package:flutter/material.dart';
import 'package:frontend/src/workorder/domain/entities/qm_work_order.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final qmWorkOrderListNotifier = ChangeNotifierProvider(
  (ref) => QmWorkOrderListNotifier(),
);

class TableHeaderFilterItem {
  final bool isSelected;
  final String name;

  const TableHeaderFilterItem({
    required this.isSelected,
    required this.name,
  });
}

class QmWorkOrderListNotifier with ChangeNotifier {
  /// 현재 페이지 번호
  int _currentPage = 1;

  List<QmWorkOrder> _items = [];

  List<QmWorkOrder> get items => _items;

  final Set<int> selectedIndex = <int>{};

  final Map<String, Set<String>> filterMap = {};

  final Map<String, bool> sortedColumn = <String, bool>{};

  int get page => _currentPage;

  /// 여러가지 선택모드인지 확인
  bool get isMultiSelectMode => selectedIndex.isNotEmpty;

  List<QmWorkOrder> get filteredItems {
    return items.where((item) {
      if (filterMap.isEmpty) {
        return true;
      }

      final List<bool> canBeIn = [];

      filterMap.forEach(
        (key, values) {
          if (values.toList().contains(item.getProp(key))) {
            canBeIn.add(true);
          } else {
            canBeIn.add(false);
          }
        },
      );

      late final bool result;

      if (canBeIn.isEmpty) {
        result = true;
      } else {
        result = canBeIn.reduce((value, element) => value && element);
      }

      return result;
    }).toList();
  }

  /// 선택된 item
  List<QmWorkOrder> get selectedItem =>
      selectedIndex.map((index) => _items[index]).toList();

  void removeFilter(String key) {
    filterMap.remove(key);
    notifyListeners();
  }

  void clearFilter() {
    filterMap.clear();
    notifyListeners();
  }

  /// filter 값 넣기
  void setFilter(String key, List<String> value) {
    filterMap[key] = Set.from(value);
    if (filterMap[key]!.isEmpty) {
      filterMap.remove(key);
    }
    notifyListeners();
  }

  /// workOrder 넣기
  void setItems(List<QmWorkOrder> items) {
    _items = items;
    notifyListeners();
  }

  void removeAt(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void setOrderList(List<QmWorkOrder> value) {
    _currentPage += 1;
    selectedIndex.clear();
    _items = value;
    notifyListeners();
  }

  void clear() {
    _currentPage = 1;
    selectedIndex.clear();
    _items.clear();
    sortedColumn.clear();
    clearFilter();
    notifyListeners();
  }

  void toggleSelectState(int index) {
    if (selectedIndex.contains(index)) {
      selectedIndex.remove(index);
    } else {
      selectedIndex.add(index);
    }
    notifyListeners();
  }

  void clearSelection() {
    selectedIndex.clear();
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
