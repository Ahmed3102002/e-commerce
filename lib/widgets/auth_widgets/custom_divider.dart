import 'package:flutter/material.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).dividerColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 1,
            color: color,
          ),
        ),
        const CustomText(
          title: "Or",
          fontSize: 14,
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 1,
            color: color,
          ),
        ),
      ],
    );
  }
}
