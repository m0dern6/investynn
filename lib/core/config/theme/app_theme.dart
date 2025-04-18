import 'package:flutter/material.dart';
import 'package:investynn/core/config/theme/app_text_style.dart';
import 'package:investynn/core/const/color_const.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: AppColors.primary300,
    onPrimary: AppColors.neutral0,
    secondary: AppColors.success300,
    error: AppColors.danger300,
    surface: AppColors.primary50,
    onSurface: AppColors.neutral600,
    onSurfaceVariant: AppColors.neutral100,
  ),
  textTheme: const TextTheme(
    // Headings
    displayLarge: AppTextStyles.h1Bold,
    displayMedium: AppTextStyles.h2Bold,
    displaySmall: AppTextStyles.h3Bold,
    headlineMedium: AppTextStyles.h4Bold,
    headlineSmall: AppTextStyles.h5Bold,
    titleLarge: AppTextStyles.h6Bold,
    titleMedium: AppTextStyles.h7Bold,
    // Body
    bodyLarge: AppTextStyles.b1,
    bodyMedium: AppTextStyles.b2,
    // Small
    bodySmall: AppTextStyles.s1,
    labelSmall: AppTextStyles.s2,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.neutral0,
    foregroundColor: AppColors.neutral800,
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: AppColors.primary300,
    onPrimary: AppColors.neutral900,
    secondary: AppColors.success300,
    error: AppColors.danger300,
    surface: AppColors.neutral800,
    onSurface: AppColors.neutral50,
  ),
  textTheme: TextTheme(
    displayLarge: AppTextStyles.h1Bold.copyWith(color: AppColors.neutral0),
    displayMedium: AppTextStyles.h2Bold.copyWith(color: AppColors.neutral0),
    displaySmall: AppTextStyles.h3Bold.copyWith(color: AppColors.neutral0),
    headlineMedium: AppTextStyles.h4Bold.copyWith(color: AppColors.neutral0),
    headlineSmall: AppTextStyles.h5Bold.copyWith(color: AppColors.neutral0),
    titleLarge: AppTextStyles.h6Bold.copyWith(color: AppColors.neutral0),
    titleMedium: AppTextStyles.h7Bold.copyWith(color: AppColors.neutral0),
    bodyLarge: AppTextStyles.b1.copyWith(color: AppColors.neutral100),
    bodyMedium: AppTextStyles.b2.copyWith(color: AppColors.neutral100),
    bodySmall: AppTextStyles.s1.copyWith(color: AppColors.neutral100),
    labelSmall: AppTextStyles.s2.copyWith(color: AppColors.neutral100),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.neutral800,
    foregroundColor: AppColors.neutral0,
  ),
);
