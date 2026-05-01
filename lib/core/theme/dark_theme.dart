import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'light_theme.dart'; // Reuse helpers if possible, or define them in a common file.

ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.secondaryDark,
      surface: AppColors.surfaceDark,
      error: AppColors.errorDark,
      onPrimary: AppColors.onPrimaryDark,
      onSecondary: AppColors.onSecondaryDark,
      onSurface: AppColors.onSurfaceDark,
      onError: AppColors.onErrorDark,
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    // I'll reuse the helper logic by passing specific values or just re-implementing if small.
    // For extreme atomization, I'll just re-implement concisely.
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      foregroundColor: AppColors.onSurfaceDark,
      elevation: 0,
      titleTextStyle: AppTypography.h3.copyWith(color: AppColors.onSurfaceDark),
    ),
    textTheme: TextTheme(
      displayLarge: AppTypography.h1.copyWith(color: AppColors.onBackgroundDark),
      displayMedium: AppTypography.h2.copyWith(color: AppColors.onBackgroundDark),
      displaySmall: AppTypography.h3.copyWith(color: AppColors.onBackgroundDark),
      bodyLarge: AppTypography.bodyLarge.copyWith(color: AppColors.onBackgroundDark),
      bodyMedium: AppTypography.bodyMedium.copyWith(color: AppColors.onBackgroundDark),
      labelLarge: AppTypography.labelLarge.copyWith(color: AppColors.onPrimaryDark),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDark,
        foregroundColor: AppColors.onPrimaryDark,
        textStyle: AppTypography.labelLarge,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
