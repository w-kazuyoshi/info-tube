import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appThemeData = ThemeData(
    primarySwatch: materialColorPalette,
  );

  static const MaterialColor materialColorPalette = MaterialColor(
    _materialColorPalettePrimaryValue,
    <int, Color>{
      50: Color(0xFFFFE0E0),
      100: Color(0xFFFFB3B3),
      200: Color(0xFFFF8080),
      300: Color(0xFFFF4D4D),
      400: Color(0xFFFF2626),
      500: Color(_materialColorPalettePrimaryValue),
      600: Color(0xFFFF0000),
      700: Color(0xFFFF0000),
      800: Color(0xFFFF0000),
      900: Color(0xFFFF0000),
    },
  );
  static const int _materialColorPalettePrimaryValue = 0xFFFF0000;

  static const MaterialColor materialColorPaletteAccent = MaterialColor(
    _materialColorPaletteAccentValue,
    <int, Color>{
      100: Color(0xFFFFFFFF),
      200: Color(_materialColorPaletteAccentValue),
      400: Color(0xFFFFBFBF),
      700: Color(0xFFFFA6A6),
    },
  );
  static const int _materialColorPaletteAccentValue = 0xFFFFF2F2;
}
