import 'package:flutter/material.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

class CustomListIcon extends StatelessWidget {
  const CustomListIcon({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
  });
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final Color dividerColor2 = Theme.of(context).dividerColor;
    return Center(
      child: TextButton.icon(
        onPressed: onPressed ?? () => Navigator.canPop(context),
        icon: Icon(icon, color: dividerColor2),
        label: CustomText(
          title: title,
          fontSize: 15,
        ),
      ),
    );
  }
}
