// TODO(ymkwon): add theme data for light/dark mode
import 'package:flutter/material.dart';
import 'package:frontend/src/core/constants/index.dart';
import 'package:frontend/src/core/generated/fonts.gen.dart';

class AppTheme {
  const AppTheme._();

  static final light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: ThemeConstant.dominantColor,
    errorColor: ThemeConstant.errorColor,
    fontFamily: FontFamily.maruburi,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: ThemeConstant.dominantColor,
    errorColor: ThemeConstant.errorColor,
    fontFamily: FontFamily.maruburi,
  );
}
