import 'package:flutter/material.dart';
import 'package:store/root_of_pages.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

class EmptyBag extends StatelessWidget {
  const EmptyBag(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image,
      this.height = 0.35});
  final String image;
  final String title;
  final String subTitle;
  final double height;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Image.asset(
              image,
              width: double.infinity,
              height: size.height * height,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
              title: 'Whoops!',
              fontSize: 30,
              color: Colors.red,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomText(
              title: title,
              fontSize: 22,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomText(
              title: subTitle,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, RootOfPages.routName),
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: Theme.of(context).dividerColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              child: CustomText(
                title: 'Shop now',
                fontSize: 20,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
