import 'package:flutter/material.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final workOrderListNotifier = ChangeNotifierProvider(
  (ref) => WorkOrderListNotifier(),
);

class WorkOrderListNotifier with ChangeNotifier {
  WorkOrderListNotifier() : super();

  int _currentPage = 1;

  List<WorkOrder> items = [];

  final Set<int> selectedIndex = <int>{};

  int get page => _currentPage;

  /// 여러가지 선택모드인지 확인
  bool get isMultiSelectMode => selectedIndex.isNotEmpty;

  /// 선택된 item
  List<WorkOrder> get selectedQmItem =>
      selectedIndex.map((index) => items[index]).toList();

  /// 선택한 아이템들 모두 값이 비어 있는지(=저장할 수 있는지) 확인
  bool get isStartActive {
    return selectedIndex.firstWhere(
            (index) => items[index].dateStart.isNotEmpty,
            orElse: () => -1) ==
        -1;

    //// Original logic
    // bool isActive = true;
    //
    // for (final index in selectedIndex) {
    //   if (qmItems[index].dateStart.isNotEmpty) {
    //     return isActive = false;
    //   } else {
    //     isActive = true;
    //   }
    // }
    // return isActive;
  }

  /// 선택한 아이템들 모두 값이 비어 있는지(=저장할 수 있는지) 확인
  bool get isEndActive {
    return selectedIndex.firstWhere(
            (index) =>
                items[index].dateStart.isEmpty ||
                items[index].dateEnd.isNotEmpty,
            orElse: () => -1) ==
        -1;

    //// Original logic
    // bool isActive = true;
    //
    // for (final index in selectedIndex) {
    //   if (qmItems[index].dateStart.isNotEmpty &&
    //       qmItems[index].dateEnd.isEmpty) {
    //     isActive = true;
    //   } else {
    //     return isActive = false;
    //   }
    // }
    // return isActive;
  }

  void setNewItemDateStart(int index, String date) {
    items[index] = items[index].copyWith(
      dateStart: date,
    );
  }

  void setNewItemDateEnd(int index, String date) {
    items[index] = items[index].copyWith(
      dateEnd: date,
    );
  }

  void setNewListDateStart(List<int> indice, String date) {
    for (final index in indice) {
      items[index] = items[index].copyWith(
        dateStart: date,
      );
    }
    notifyListeners();
  }

  void setNewListDateEnd(List<int> indice, String date) {
    for (final index in indice) {
      items[index] = items[index].copyWith(
        dateEnd: date,
      );
    }
    notifyListeners();
  }

  void setOrderList(List<WorkOrder> value) {
    _currentPage += 1;
    selectedIndex.clear();
    items = value;
    notifyListeners();
  }

  void clear() {
    _currentPage = 1;
    selectedIndex.clear();
    items.clear();
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
}
