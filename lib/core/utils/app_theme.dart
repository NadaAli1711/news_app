import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.black,
    cardColor: AppColors.white,
    textSelectionTheme: TextSelectionThemeData(
      selectionHandleColor: AppColors.transparent,
      cursorColor: AppColors.black,
      selectionColor: AppColors.greyOpcity20,
    ),
    textTheme: TextTheme(
      bodyLarge: AppStyles.black20Medium,
      bodyMedium: AppStyles.black16Bold,
      bodySmall: AppStyles.black14Medium,
      headlineLarge: AppStyles.black24Medium,
      headlineMedium: AppStyles.white24Bold,
      headlineSmall: AppStyles.white14Medium,
      labelMedium: AppStyles.white16Bold,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    primaryColor: AppColors.white,
    cardColor: AppColors.black,
    textSelectionTheme: TextSelectionThemeData(
      selectionHandleColor: AppColors.transparent,
      cursorColor: AppColors.white,
      selectionColor: AppColors.whiteOpcity20,
    ),
    textTheme: TextTheme(
      bodyLarge: AppStyles.white20Medium,
      bodyMedium: AppStyles.white16Bold,
      bodySmall: AppStyles.white14Medium,
      headlineLarge: AppStyles.white24Medium,
      headlineMedium: AppStyles.black24Bold,
      headlineSmall: AppStyles.black14Medium,
      labelMedium: AppStyles.black16Bold,
    ),
  );
}
