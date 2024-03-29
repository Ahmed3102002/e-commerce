import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/theme_provider.dart';
import 'package:store/utils/assets_manger/assets_manger.dart';
import 'package:store/utils/colors/app_colors.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

class CustomSwitchThemesButton extends StatelessWidget {
  const CustomSwitchThemesButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SwitchListTile(
      secondary: Image.asset(
        AssetsManger.theme,
        height: 40,
        width: 50,
      ),
      value: themeProvider.getIsDarkTheme,
      activeColor: themeProvider.getIsDarkTheme
          ? AppColors.darkSwitchColor
          : AppColors.lightSwitchColor,
      onChanged: (value) => themeProvider.setDarkTheme(themeValue: value),
      title: CustomText(
        title: themeProvider.getIsDarkTheme ? 'Dark Mode' : 'Light Mode',
        fontSize: 14,
      ),
    );
  }
}
