import 'package:flutter/material.dart';
import 'package:frontend/src/qm/domain/entities/qm_menu.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final qmMenulistNotifierProvider = ChangeNotifierProvider(
  (ref) => QmMenulistNotifier(),
);

class QmMenulistNotifier with ChangeNotifier {
  List<QmMenu> menus = [];

  void setNewMenus(List<QmMenu> items) {
    menus = items;
    notifyListeners();
  }
}
