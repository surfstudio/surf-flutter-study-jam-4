import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/core/dark_theme_colors.dart';
import 'package:surf_practice_magic_ball/core/light_theme_colors.dart';

enum AppTheme { lightTheme, darkTheme }

class AppThemes {
  const AppThemes._();

  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      scaffoldBackgroundColor: LightThemeColors.backgroundColor,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: LightThemeColors.backgroundColor,
        scrolledUnderElevation: 0.0,
        iconTheme: IconThemeData(color: LightThemeColors.textColor),
      ),
      // TODO also need to add textTheme to light and dark themes
    ),
    AppTheme.darkTheme: ThemeData(
      scaffoldBackgroundColor: DarkThemeColors.backgroundColor,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: DarkThemeColors.backgroundColor,
        scrolledUnderElevation: 0.0,
        iconTheme: IconThemeData(color: DarkThemeColors.textColor),
      )
    ),
  };
}
