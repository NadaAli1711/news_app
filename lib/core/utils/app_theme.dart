import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.black,
  textTheme: TextTheme(
    bodyLarge: AppStyles.black20Medium,
    bodyMedium: AppStyles.black16Bold,
    bodySmall: AppStyles.black14Medium,
  ));
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.black,
      primaryColor: AppColors.white,
      textTheme: TextTheme(
        bodyLarge: AppStyles.white20Medium,
        bodyMedium: AppStyles.white16Bold,
        bodySmall: AppStyles.white14Medium,
      )
  );
}
