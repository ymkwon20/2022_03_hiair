import 'package:flutter/material.dart';
import 'package:frontend/src/auth/domain/entities/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authChangeNotifierProvider = Provider(
  (ref) => AuthChangeNotifier(),
);

class AuthChangeNotifier with ChangeNotifier {
  bool _isLoginChecked = false;

  User? _user;

  User? get user => _user;
  bool get isLoggedIn => _user != null;

  bool get isLoginChecked => _isLoginChecked;

  void changeCheckStatus() {
    _isLoginChecked = true;
  }

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void emptUser() {
    _user = null;
    notifyListeners();
  }
}
