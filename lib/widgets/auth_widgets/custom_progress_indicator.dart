import 'package:flutter/material.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
    this.title = 'please,waiting for transaction is processing ...',
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: Theme.of(context).dividerColor,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.3,
        ),
        CustomText(
          title: title,
          fontSize: 14,
        )
      ],
    );
  }
}
