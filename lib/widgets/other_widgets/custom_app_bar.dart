import 'package:flutter/material.dart';
import 'package:store/utils/assets_manger/assets_manger.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';
import 'package:store/widgets/other_widgets/shimmer_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle = false,
  });
  final bool? centerTitle;
  final String title;
  final List<Widget>? actions;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Image.asset(
          AssetsManger.shoppingCart,
        ),
      ),
      title: ShimmerText(
        child: CustomText(
          title: title,
          fontSize: 18,
        ),
      ),
      actions: actions,
    );
  }
}
