import 'package:flutter/material.dart';
import 'package:store/utils/colors/app_colors.dart';

class LightThemeData {
  static ThemeData themeData() {
    return ThemeData(
      dividerColor: AppColors.darkPrimaryColor,
      scaffoldBackgroundColor: AppColors.lightScaffoldBackgroundColor,
      useMaterial3: false,
      cardColor: AppColors.darkCardColor,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightScaffoldBackgroundColor,
        elevation: 0,
      ),
    );
  }
}
