import 'package:flutter/material.dart';
import 'package:store/widgets/other_widgets/custom_app_bar.dart';
import 'package:store/widgets/other_widgets/empty_bag.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({
    super.key,
    required this.appBarTitle,
    required this.title,
    required this.subTitle,
    required this.image,
  });
  final String appBarTitle;
  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: appBarTitle),
        body: EmptyBag(
          image: image,
          title: title,
          subTitle: subTitle,
        ),
      ),
    );
  }
}
