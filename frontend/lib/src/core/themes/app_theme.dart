// TODO(ymkwon): add theme data for light/dark mode
import 'package:flutter/material.dart';
import 'package:frontend/src/core/generated/fonts.gen.dart';

class AppTheme {
  const AppTheme._();

  static final light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.indigo,
    fontFamily: FontFamily.iropke,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
    fontFamily: FontFamily.iropke,
  );
}
