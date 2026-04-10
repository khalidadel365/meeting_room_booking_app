import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData appTheme = ThemeData(
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: AppColors.primaryColor,
      headerForegroundColor: Colors.white,
      todayBackgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
    ),
    timePickerTheme: TimePickerThemeData(
      dialHandColor: AppColors.primaryColor,
      hourMinuteTextColor: AppColors.primaryColor,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor,
    ),
    fontFamily: AppTextStyles.fontFamily,
    scaffoldBackgroundColor: AppColors.backgroundColor,
  );
}
