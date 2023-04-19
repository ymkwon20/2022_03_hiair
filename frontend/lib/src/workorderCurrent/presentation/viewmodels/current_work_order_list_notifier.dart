import 'package:flutter/material.dart';
import 'package:frontend/src/core/domain/entities/table_cell.dart';
import 'package:frontend/src/workorder/domain/entities/work_order_status.dart';
import 'package:frontend/src/workorderCurrent/domain/entities/current_work_order.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentWorkOrderListNotifier = ChangeNotifierProvider.autoDispose(
  (ref) => CurrentWorkOrderListNotifier(),
);

final currentWorkOrderNotifier = Provider<CurrentWorkOrder>(
  (ref) => throw UnimplementedError(),
);

final currentWorkOrderIndexNotifier = Provider<int>(
  (ref) => throw UnimplementedError(),
);

final tableColumnNotifier = StateProvider<String>(
  (_) => "",
);

final currentWorkOrderColumnFilterProvider =
    StateProvider.autoDispose<List<TableHeaderFilterItem>>((ref) {
  final List<TableCellEntity> tableCells =
      // ref.watch(workOrderListNotifier).items;
      ref.watch(currentWorkOrderListNotifier).filteredItems;
  final column = ref.watch(tableColumnNotifier);
  final filterMap = ref.watch(currentWorkOrderListNotifier).filterMap[column];

  final itemList = tableCells
      .map((e) => e.getProp(column) ?? "")
      .where((element) => element != "")
      .toSet();

  return itemList.map<TableHeaderFilterItem>((original) {
    if (filterMap == null) {
      return TableHeaderFilterItem(isSelected: false, name: original);
    }

    for (final filter in filterMap) {
      if (original == filter) {
        return TableHeaderFilterItem(isSelected: true, name: original);
      }
    }

    return TableHeaderFilterItem(isSelected: false, name: original);
  }).toList();
});

class TableHeaderFilterItem {
  final bool isSelected;
  final String name;

  const TableHeaderFilterItem({
    required this.isSelected,
    required this.name,
  });
}

class CurrentWorkOrderListNotifier with ChangeNotifier {
  List<CurrentWorkOrder> _items = [];

  List<CurrentWorkOrder> get items => _items;

  final Set<int> selectedIndex = <int>{};

  final Map<String, Set<String>> filterMap = {};

  final Map<String, bool> sortedColumn = <String, bool>{};

  bool get isMultiSelectMode => selectedIndex.isNotEmpty;

  List<CurrentWorkOrder> get filteredItems {
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
  List<CurrentWorkOrder> get selectedItem =>
      selectedIndex.map((index) => filteredItems[index]).toList();

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
  void setItems(List<CurrentWorkOrder> items) {
    _items = items;
    notifyListeners();
  }

  void clear() {
    selectedIndex.clear();
    _items.clear();
    sortedColumn.clear();
    // clearFilter();
    notifyListeners();
  }

  void sort(String key) {
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
