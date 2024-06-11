import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => _lightTheme;
  static ThemeData get darkTheme => _darkTheme;
}

final _lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
  ),
);

final _darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
  ),
);
