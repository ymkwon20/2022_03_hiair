import 'package:flutter/material.dart';

abstract class SettingsService {
  Future<ThemeMode> get themeMode;
  Future<void> updateThemeMode(ThemeMode theme);
}
