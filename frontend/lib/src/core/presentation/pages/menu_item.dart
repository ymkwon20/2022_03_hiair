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
    text: "Pages",
    icon: Icons.pages,
  );

  static const itemSignOut = MenuEntity(
    text: "Sign Out",
    icon: Icons.logout,
  );
}
