import 'package:flutter/material.dart';
import 'package:frontend/src/core/domain/entities/table_cell.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/workorder/domain/entities/work_order.dart';
import 'package:frontend/src/workorder/domain/entities/work_order_status.dart';

final workOrderListNotifier = ChangeNotifierProvider.autoDispose(
  (ref) => WorkOrderListNotifier(),
);

final workOrderNotifier = Provider<WorkOrder>(
  (ref) => throw UnimplementedError(),
);

final workOrderIndexNotifier = Provider<int>(
  (ref) => throw UnimplementedError(),
);

final tableColumnNotifier = StateProvider<String>(
  (_) => "",
);

final columnFilterProvider =
    StateProvider.autoDispose<List<TableHeaderFilterItem>>((ref) {
  final List<TableCellEntity> tableCells =
      // ref.watch(workOrderListNotifier).items;
      ref.watch(workOrderListNotifier).filteredItems;
  final column = ref.watch(tableColumnNotifier);
  final filterMap = ref.watch(workOrderListNotifier).filterMap[column];

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

class WorkOrderListNotifier with ChangeNotifier {
  /// 현재 페이지 번호
  int _currentPage = 1;

  List<WorkOrder> _items = [];

  List<WorkOrder> get items => _items;

  final Set<int> selectedIndex = <int>{};

  final Map<String, Set<String>> filterMap = {};

  final Map<String, bool> sortedColumn = <String, bool>{};

  int get page => _currentPage;

  /// 여러가지 선택모드인지 확인
  bool get isMultiSelectMode => selectedIndex.isNotEmpty;

  List<WorkOrder> get filteredItems {
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
  List<WorkOrder> get selectedItem =>
      selectedIndex.map((index) => filteredItems[index]).toList();

  /// 선택한 아이템들 모두 값이 비어 있는지(=저장할 수 있는지) 확인
  bool get isStartActive {
    return selectedIndex.firstWhere(
            (index) => filteredItems[index].dateStart.isNotEmpty,
            orElse: () => -1) ==
        -1;
  }

  /// 선택한 아이템들 모두 값이 비어 있는지(=저장할 수 있는지) 확인
  bool get isEndActive {
    return selectedIndex.firstWhere(
            (index) =>
                filteredItems[index].dateStart.isEmpty ||
                filteredItems[index].dateEnd.isNotEmpty,
            orElse: () => -1) ==
        -1;
  }

  void removeFilter(String key) {
    filterMap.remove(key);
    notifyListeners();
  }

  void clearFilter() {
    filterMap.clear();
    notifyListeners();
  }

  void screenUpdate() {
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
  void setItems(List<WorkOrder> items) {
    _items = items;
    notifyListeners();
  }

  void setNewItemDateStart(int index, String date) {
    _items[index] = _items[index].copyWith(
      dateStart: date,
      status: WorkOrderStatus.resuming,
    );
    notifyListeners();
  }

  void setNewItemDateEnd(int index) {
    // items[index] = items[index].copyWith(
    //   dateEnd: date,
    // );
    _items.removeAt(index);
    notifyListeners();
  }

  void setItemDateCancel(int index) {
    _items[index] = items[index].copyWith(
      dateStart: '',
      status: WorkOrderStatus.waiting,
    );
  }

  void setNewListDateStart(List<int> indice, String date) {
    for (final index in indice) {
      _items[index] = _items[index].copyWith(
        dateStart: date,
        status: WorkOrderStatus.resuming,
      );
    }
    notifyListeners();
  }

  void setNewListDateEnd(List<int> indice) {
    /// * mistake
    // for (final index in indice) {
    //   _items.removeAt(index);
    // }

    // list 가 순서에 맞게 들어오지 않음
    indice.sort((a, b) => a.compareTo(b));

    for (var i = indice.length - 1; i >= 0; i--) {
      _items.removeAt(indice[i]);
    }
    notifyListeners();
  }

  void setListDateCancel(List<int> indice) {
    for (final index in indice) {
      _items[index] = _items[index].copyWith(
        dateStart: '',
        status: WorkOrderStatus.waiting,
      );
    }
  }

  void setOrderList(List<WorkOrder> value) {
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
    // clearFilter();
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

  // int _compareBetween(WorkOrder a, WorkOrder b) {
  // final wbAscending = sortedColumn[0];
  // final statusAscending = sortedColumn[1];

  // if (wbAscending != null) {
  //   // 공정 이름으로 정렬
  //   int wbComp = (wbAscending ? 1 : -1) * a.wbNm.compareTo(b.wbNm);

  //   // 현 공정 상태도 있으면 그것으로도 정렬
  //   if (statusAscending != null) {
  //     if (wbComp == 0) {
  //       return (statusAscending ? 1 : -1) *
  //           a.status.toString().compareTo(b.status.toString());
  //     }
  //   }

  //   // 더이상 진행안하고 리턴
  //   return wbComp;
  // } else {
  //   late int statusComp;
  //   if (statusAscending != null) {
  //     statusComp = (statusAscending ? 1 : -1) *
  //         a.status.toString().compareTo(b.status.toString());
  //   } else {
  //     statusComp = a.status.toString().compareTo(b.status.toString());
  //   }

  //   return statusComp;
  // }
  // }
}
