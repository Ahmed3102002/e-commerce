import 'package:flutter/material.dart';
import 'package:store/utils/constant/const_values.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

class CustomElvatedButtonWithIcon extends StatelessWidget {
  const CustomElvatedButtonWithIcon({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 5),
    this.iconColor,
  });
  final IconData icon;
  final String title;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5,
      borderRadius: ConstValues.borderRadius,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            padding: padding,
            shape: const RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: ConstValues.borderRadius,
            ),
            backgroundColor: Theme.of(context).dividerColor),
        onPressed: onPressed ?? () {},
        icon: Icon(
          icon,
          color: iconColor ?? Theme.of(context).scaffoldBackgroundColor,
        ),
        label: CustomText(
          title: title,
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
