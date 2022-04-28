import 'package:flutter/material.dart';
import 'package:frontend/src/qm/domain/entities/qm_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final qmItemsNotifier = ChangeNotifierProvider(
  (ref) => QmItemsNotifier(),
);

class QmItemsNotifier with ChangeNotifier {
  QmItemsNotifier() : super();

  List<QmItem> qmItems = [];

  final Set<int> selectedIndex = <int>{};

  /// 여러가지 선택모드인지 확인
  bool get isMultiSelectMode => selectedIndex.isNotEmpty;

  /// 선택된 item
  List<QmItem> get selectedQmItem =>
      selectedIndex.map((index) => qmItems[index]).toList();

  /// 선택한 아이템들 모두 값이 비어 있는지(=저장할 수 있는지) 확인
  bool get isStartActive {
    return selectedIndex.firstWhere(
            (index) => qmItems[index].dateStart.isNotEmpty,
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
                qmItems[index].dateStart.isEmpty ||
                qmItems[index].dateEnd.isNotEmpty,
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
    qmItems[index] = qmItems[index].copyWith(
      dateStart: date,
    );
  }

  void setNewItemDateEnd(int index, String date) {
    qmItems[index] = qmItems[index].copyWith(
      dateEnd: date,
    );
  }

  void setNewListDateStart(List<int> indice, String date) {
    for (final index in indice) {
      qmItems[index] = qmItems[index].copyWith(
        dateStart: date,
      );
    }
    notifyListeners();
  }

  void setNewListDateEnd(List<int> indice, String date) {
    for (final index in indice) {
      qmItems[index] = qmItems[index].copyWith(
        dateEnd: date,
      );
    }
    notifyListeners();
  }

  void setQmItems(List<QmItem> items) {
    selectedIndex.clear();
    qmItems = items;
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
