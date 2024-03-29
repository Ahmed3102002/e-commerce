import 'package:flutter/material.dart';
import 'package:store/utils/colors/app_colors.dart';

class DarkThemeData {
  static ThemeData themeData() {
    return ThemeData(
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              iconColor: MaterialStateProperty.all(
        AppColors.lightPrimaryColor,
      ))),
      dividerColor: AppColors.lightPrimaryColor,
      scaffoldBackgroundColor: AppColors.darkScaffoldBackgroundColor,
      useMaterial3: false,
      cardColor: AppColors.lightCardColor,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkScaffoldBackgroundColor,
        elevation: 0,
      ),
    );
  }
}
