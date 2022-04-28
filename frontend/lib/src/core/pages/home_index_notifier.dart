import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeIndexNotifier = ChangeNotifierProvider(
  (ref) => HomeIndexChangeNotifier(),
);

class HomeIndexChangeNotifier with ChangeNotifier {
  HomeIndexChangeNotifier();

  int _index = 0;

  int get currentIndex => _index;

  void moveTo(int index) {
    _index = index;
    notifyListeners();
  }
}
