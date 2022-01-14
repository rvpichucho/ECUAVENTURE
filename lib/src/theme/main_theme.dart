import 'package:flutter/material.dart';

class AppTheme {
  static const Color colorMediumPriority = Colors.yellow;
  static final Color colorLowPriority = Colors.green.shade400;
  static final Color colorHighPriority = Colors.red;
  static ThemeData themeData(bool ligthMode) {
    return ThemeData(
      primaryColor: const Color(0xFF1d87e5),
      primaryColorDark: const Color(0xFF005bb2),
      primaryColorLight: const Color(0xFF69b6ff),
      tabBarTheme: TabBarTheme(
          unselectedLabelColor: Colors.grey,
          labelColor: ligthMode ? const Color(0xFF283593) : Colors.white),
      colorScheme: ColorScheme(
          primary: const Color(0xFF283593),
          primaryVariant: const Color(0xFF1d87e5),
          secondary: const Color(0xFFffee58),
          secondaryVariant: const Color(0xFFc9bc1f),
          surface: Colors.white,
          background: Colors.grey,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: ligthMode ? Brightness.dark : Brightness.light),
    );
  }
}
