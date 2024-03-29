import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:store/utils/constant/const_values.dart';

class CustomSwiperImages extends StatelessWidget {
  const CustomSwiperImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      height: size.height * 0.25,
      child: Swiper(
        viewportFraction: 0.95,
        scale: 0.95,
        // itemWidth: 300.0,
        //layout: SwiperLayout.TINDER,
        autoplay: true,
        duration: 10,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: ConstValues.borderRadius,
            child: Image.asset(
              ConstValues.bannersImages[index],
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: ConstValues.bannersImages.length,
        pagination: SwiperPagination(
          //  margin: const EdgeInsets.only(bottom: 20),
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
              color: Theme.of(context).scaffoldBackgroundColor,
              activeColor: Theme.of(context).dividerColor),
        ),
        /* control: SwiperControl(
          size: 20,
            padding: const EdgeInsets.all(12.0),
            color: Theme.of(context).scaffoldBackgroundColor),*/
      ),
    );
  }
}
