// TODO(ymkwon): add theme data for light/dark mode
import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/fonts.gen.dart';
import 'package:frontend/src/core/presentation/index.dart';

class AppTheme {
  const AppTheme._();

  static final light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: ThemeConstant.dominantColor,
    errorColor: ThemeConstant.errorColor,
    selectedRowColor: Colors.grey[500],
    fontFamily: FontFamily.maruburi,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: ThemeConstant.dominantColor,
    errorColor: ThemeConstant.errorColor,
    selectedRowColor: Colors.grey[500],
    fontFamily: FontFamily.maruburi,
  );
}
