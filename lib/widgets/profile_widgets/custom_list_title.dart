import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CustomListTitle extends StatelessWidget {
  const CustomListTitle({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });
  final String image;
  final Widget title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(
        image,
        height: 40,
        width: 50,
      ),
      title: title,
      trailing: Icon(
        IconlyBroken.arrowRight2,
        color: Theme.of(context).dividerColor,
      ),
    );
  }
}
