import 'package:flutter/material.dart';
import 'package:frontend/src/workorder/domain/entities/work_order.dart';
import 'package:frontend/src/workorder/domain/entities/work_order_status.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final workOrderListNotifier = ChangeNotifierProvider(
  (ref) => WorkOrderListNotifier(),
);

final workOrderNotifier = Provider<WorkOrder>(
  (ref) => throw UnimplementedError(),
);

final workOrderIndexNotifier = Provider<int>(
  (ref) => throw UnimplementedError(),
);

class WorkOrderListNotifier with ChangeNotifier {
  /// 현재 페이지 번호
  int _currentPage = 1;

  List<WorkOrder> _items = [];

  List<WorkOrder> get items => _items;

  final Set<int> selectedIndex = <int>{};

  final Map<int, bool> sortedColumn = <int, bool>{};

  int get page => _currentPage;

  /// 여러가지 선택모드인지 확인
  bool get isMultiSelectMode => selectedIndex.isNotEmpty;

  /// 선택된 item
  List<WorkOrder> get selectedQmItem =>
      selectedIndex.map((index) => _items[index]).toList();

  /// 선택한 아이템들 모두 값이 비어 있는지(=저장할 수 있는지) 확인
  bool get isStartActive {
    return selectedIndex.firstWhere(
            (index) => _items[index].dateStart.isNotEmpty,
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
                _items[index].dateStart.isEmpty ||
                _items[index].dateEnd.isNotEmpty,
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

  void setItems(List<WorkOrder> items) {
    _items = items;
  }

  void setNewItemDateStart(int index, String date) {
    _items[index] = _items[index].copyWith(
      dateStart: date,
      status: WorkOrderStatus.resuming,
    );
  }

  void setNewItemDateEnd(int index) {
    // items[index] = items[index].copyWith(
    //   dateEnd: date,
    // );
    _items.removeAt(index);
  }

  void setNewListDateStart(List<int> indice, String date) {
    for (final index in indice) {
      _items[index] = _items[index].copyWith(
        dateStart: date,
      );
    }
    notifyListeners();
  }

  void setNewListDateEnd(List<int> indice, String date) {
    for (final index in indice) {
      _items[index] = _items[index].copyWith(
        dateEnd: date,
      );
    }
    notifyListeners();
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

  void sort(int index, bool isAscending) {
    sortedColumn.addAll({index: isAscending});

    _items.sort(_compareBetween);

    notifyListeners();
  }

  int _compareBetween(WorkOrder a, WorkOrder b) {
    final wbAscending = sortedColumn[0];
    final statusAscending = sortedColumn[1];

    if (wbAscending != null) {
      // 공정 이름으로 정렬
      int wbComp = (wbAscending ? 1 : -1) * a.wbNm.compareTo(b.wbNm);

      // 현 공정 상태도 있으면 그것으로도 정렬
      if (statusAscending != null) {
        if (wbComp == 0) {
          return (statusAscending ? 1 : -1) *
              a.status.toString().compareTo(b.status.toString());
        }
      }

      // 더이상 진행안하고 리턴
      return wbComp;
    } else {
      // 공정에 관한 정보가 없다면 무조건 상태에 대한 정보 하나밖에 없는 것이다
      int statusComp = (statusAscending! ? 1 : -1) *
          a.status.toString().compareTo(b.status.toString());
      return statusComp;
    }
  }
}
