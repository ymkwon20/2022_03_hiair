import 'package:flutter/material.dart';

class MenuEntity {
  final String text;
  final IconData icon;

  const MenuEntity({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuEntity> admin = [
    itemPages,
  ];

  static const List<MenuEntity> notAdmin = [
    itemSignOut,
  ];

  static const itemPages = MenuEntity(
    text: "화면",
    icon: Icons.pages,
  );

  static const itemSignOut = MenuEntity(
    text: "로그아웃",
    icon: Icons.logout,
  );
}
