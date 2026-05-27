import 'package:flutter/material.dart';

class TradeMindsTheme {
  static const Color darkNavy = Color(0xFF0A1128);
  static const Color electricGreen = Color(0xFF00FF41);
  static const Color alertRed = Color(0xFFFF2A2A);
  static const Color warningYellow = Color(0xFFFFD700);
  static const Color textLight = Color(0xFFE0E0E0);
  static const Color surfaceColor = Color(0xFF14213D);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkNavy,
      colorScheme: const ColorScheme.dark(
        primary: electricGreen,
        secondary: electricGreen,
        surface: surfaceColor,
        error: alertRed,
        onPrimary: darkNavy,
        onSecondary: darkNavy,
        onSurface: textLight,
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkNavy,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: textLight,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: textLight),
      ),
      cardTheme: CardTheme(
        color: surfaceColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: textLight, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(color: textLight, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: textLight),
        bodyMedium: TextStyle(color: textLight),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: electricGreen,
          foregroundColor: darkNavy,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: surfaceColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
      ),
    );
  }
}
