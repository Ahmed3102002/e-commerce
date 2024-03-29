import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product_model.dart';
import 'package:store/pages/inner_pages/product_details.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/providers/favourite_provider.dart';
import 'package:store/providers/viewed_recently_provider.dart';
import 'package:store/utils/constant/const_values.dart';
import 'package:store/widgets/other_widgets/custom_fancy_shimmer_image.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

class CustomLastestProducts extends StatelessWidget {
  const CustomLastestProducts({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final viewedRecentlyProvider = Provider.of<ViewedRecentlyProvider>(context);
    final Color fontColor = Theme.of(context).scaffoldBackgroundColor;
    final favouriteProvider = Provider.of<FavouriteListProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    return InkWell(
      //splashColor: Theme.of(context).scaffoldBackgroundColor,
      onTap: () {
        viewedRecentlyProvider.addToViewedRecentlyList(productModel.id);
        Navigator.pushNamed(context, ProductDetails.routName,
            arguments: productModel);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        padding: const EdgeInsets.only(
          right: 8.0,
        ),
        decoration: BoxDecoration(
          borderRadius: ConstValues.borderRadius,
          color: Theme.of(context).dividerColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFancyShimmerImage(
              image: productModel.image,
              width: MediaQuery.of(context).size.width * 0.3,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  title: productModel.title,
                  color: fontColor,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        cartProvider.addAndRemoveToCart(productModel.id);
                      },
                      icon: Icon(
                        cartProvider.productInCart(productId: productModel.id)
                            ? IconlyBroken.shieldDone
                            : IconlyBroken.buy,
                        color: fontColor,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        color: Colors.red,
                        favouriteProvider.productInFavouriteList(
                                productId: productModel.id)
                            ? IconlyBold.heart
                            : IconlyBroken.heart,
                      ),
                      onPressed: () {
                        favouriteProvider
                            .addAndRemoveToFavouriteList(productModel.id);
                      },
                    ),
                  ],
                ),
                CustomText(
                  title: '${productModel.price}',
                  color: fontColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
