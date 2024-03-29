import 'package:flutter/material.dart';
import 'package:store/pages/search_page.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

class CustomCategories extends StatelessWidget {
  const CustomCategories({
    super.key,
    required this.image,
    required this.categoryName,
  });

  final String image;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SearchPage.routName,
            arguments: categoryName);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(image, height: 50, width: 60),
          CustomText(
            title: categoryName,
          ),
        ],
      ),
    );
  }
}
