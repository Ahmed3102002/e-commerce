import 'package:flutter/material.dart';
import 'package:store/utils/constant/const_values.dart';

class CustomAuthPage extends StatelessWidget {
  const CustomAuthPage({
    super.key,
    required this.children,
  });
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    final Color scaffoldBackgroundColor2 =
        Theme.of(context).scaffoldBackgroundColor;
    final Color dividerColor2 = Theme.of(context).dividerColor;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          scaffoldBackgroundColor2,
          dividerColor2,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Material(
        shadowColor: Theme.of(context).cardColor,
        elevation: 10,
        color: Colors.transparent,
        borderRadius: ConstValues.borderRadius,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: ConstValues.borderRadius,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: children,
          ),
        ),
      ),
    );
  }
}
