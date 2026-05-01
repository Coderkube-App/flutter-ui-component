import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryLight,
      secondary: AppColors.secondaryLight,
      surface: AppColors.surfaceLight,
      error: AppColors.errorLight,
      onPrimary: AppColors.onPrimaryLight,
      onSecondary: AppColors.onSecondaryLight,
      onSurface: AppColors.onSurfaceLight,
      onError: AppColors.onErrorLight,
    ),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: _appBarTheme(Brightness.light),
    textTheme: _textTheme(Brightness.light),
    elevatedButtonTheme: _buttonTheme(AppColors.primaryLight, AppColors.onPrimaryLight),
  );
}

AppBarTheme _appBarTheme(Brightness brightness) {
  final isLight = brightness == Brightness.light;
  return AppBarTheme(
    backgroundColor: isLight ? AppColors.surfaceLight : AppColors.surfaceDark,
    foregroundColor: isLight ? AppColors.onSurfaceLight : AppColors.onSurfaceDark,
    elevation: 0,
    titleTextStyle: AppTypography.h3.copyWith(
      color: isLight ? AppColors.onSurfaceLight : AppColors.onSurfaceDark,
    ),
  );
}

TextTheme _textTheme(Brightness brightness) {
  final isLight = brightness == Brightness.light;
  final color = isLight ? AppColors.onBackgroundLight : AppColors.onBackgroundDark;
  return TextTheme(
    displayLarge: AppTypography.h1.copyWith(color: color),
    displayMedium: AppTypography.h2.copyWith(color: color),
    displaySmall: AppTypography.h3.copyWith(color: color),
    bodyLarge: AppTypography.bodyLarge.copyWith(color: color),
    bodyMedium: AppTypography.bodyMedium.copyWith(color: color),
    labelLarge: AppTypography.labelLarge.copyWith(
      color: isLight ? AppColors.onPrimaryLight : AppColors.onPrimaryDark,
    ),
  );
}

ElevatedButtonThemeData _buttonTheme(Color bg, Color fg) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: bg,
      foregroundColor: fg,
      textStyle: AppTypography.labelLarge,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
