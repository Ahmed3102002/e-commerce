import 'package:flutter/material.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

class CustomQuestion extends StatelessWidget {
  const CustomQuestion({
    super.key,
    required this.question,
    required this.title,
    required this.pageName,
  });
  final String question;
  final String title;
  final String pageName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          title: question,
          fontSize: 16,
        ),
        TextButton(
          onPressed: () => Navigator.pushReplacementNamed(context, pageName),
          child: CustomText(
            title: title,
            fontSize: 16,
            decoration: TextDecoration.underline,
          ),
        )
      ],
    );
  }
}
