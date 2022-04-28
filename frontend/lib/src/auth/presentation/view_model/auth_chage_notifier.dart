import 'package:flutter/material.dart';
import 'package:frontend/src/auth/domain/entities/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authChangeNotifierProvider = Provider(
  (ref) => AuthChangeNotifier(),
);

class AuthChangeNotifier with ChangeNotifier {
  User? _user;

  User? get user => _user;
  bool get isLoggedIn => _user != null;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void emptyUser() {
    _user = null;
    notifyListeners();
  }
}
