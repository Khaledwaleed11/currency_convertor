import 'package:flutter/material.dart';

class AppTheme {
  static const Color scaffoldBg = Color(0xFF0F172A);
  static const Color cardBg = Color(0xFF1E293B);
  static const Color primaryColor = Color(0xFF38BDF8);
  static const Color textColor = Colors.white;
  static const Color subTextColor = Color(0xFF94A3B8);

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: scaffoldBg,
    colorScheme: const ColorScheme.dark(primary: primaryColor, surface: cardBg),
    appBarTheme: const AppBarTheme(
      backgroundColor: scaffoldBg,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: textColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: primaryColor),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: textColor),
      bodyMedium: TextStyle(color: subTextColor),
    ),
  );
}
