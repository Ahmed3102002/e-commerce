import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomFancyShimmerImage extends StatelessWidget {
  const CustomFancyShimmerImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.borderRadius,
  });

  final String image;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: borderRadius ??
          const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
      child: FancyShimmerImage(
        imageUrl: image,
        height: height ?? size.height * 0.3,
        width: width ?? size.width,
        errorWidget: Icon(
          Icons.broken_image_outlined,
          color: Theme.of(context).dividerColor,
        ),
      ),
    );
  }
}
