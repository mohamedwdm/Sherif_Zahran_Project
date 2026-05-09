import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFFFF7A00),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFFF7A00),
      secondary: Color(0xFF5F5E5E),
      surface: Color(0xFFFFF8F5),
      background: Color(0xFFFFF8F5),
      onSurface: Color(0xFF251912),
      onBackground: Color(0xFF251912),
    ),
    scaffoldBackgroundColor: const Color(0xFFFFF8F5),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFF8F5),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFFFF7A00)),
      titleTextStyle: TextStyle(
        color: Color(0xFFFF7A00),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
