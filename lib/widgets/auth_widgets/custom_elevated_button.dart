import 'package:flutter/material.dart';
import 'package:store/utils/constant/const_values.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.authMethod,
    this.textColor,
    this.isAdmin = false,
  });
  final String title;
  final Future<void> Function() authMethod;
  final Color? textColor;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5,
      borderRadius: ConstValues.borderRadius,
      child: ElevatedButton(
        onPressed: authMethod,
        style: ElevatedButton.styleFrom(
          elevation: 5,
          shape: const RoundedRectangleBorder(
              side: BorderSide.none, borderRadius: ConstValues.borderRadius),
          backgroundColor: Theme.of(context).dividerColor,
        ),
        child: CustomText(
          title:
              '${ConstValues.authVariables[title]}   ${isAdmin ? 'as Admin' : ''}',
          fontSize: 16,
          color: textColor ?? Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
