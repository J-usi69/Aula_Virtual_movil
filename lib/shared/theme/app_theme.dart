//lib/shared/theme/app_theme.dart

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.black,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black54),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
