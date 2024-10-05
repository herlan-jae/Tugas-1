import 'package:flutter/material.dart';

// Theme Color
class ThemeColors {
  static Color lightScaffoldColor = Colors.white;
  static Color darkScaffoldColor = const Color.fromARGB(255, 9, 3, 27);
}

// Theme Data
class Themes {
  static ThemeData themeData({
    required bool isDarkTheme,
    required BuildContext context,
  }) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme
          ? ThemeColors.darkScaffoldColor
          : ThemeColors.lightScaffoldColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme
            ? ThemeColors.darkScaffoldColor
            : ThemeColors.lightScaffoldColor,
            elevation: 0.0
      )
    );
  }
}