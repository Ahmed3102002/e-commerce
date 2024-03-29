import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store/pages/inner_pages/product_details.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/providers/favourite_provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/providers/viewed_recently_provider.dart';
import 'package:store/utils/constant/const_values.dart';
import 'package:store/widgets/other_widgets/custom_fancy_shimmer_image.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

class CustomProductView extends StatelessWidget {
  const CustomProductView({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  build(BuildContext context) {
    final viewedRecentlyProvider = Provider.of<ViewedRecentlyProvider>(context);
    final productProvider =
        Provider.of<ProductProvider>(context).findProduct(productId);
    final favouriteProvider = Provider.of<FavouriteListProvider>(context);
    final Color fontColor = Theme.of(context).scaffoldBackgroundColor;
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    return productProvider == null
        ? const SizedBox.shrink()
        : FittedBox(
            child: InkWell(
              borderRadius: ConstValues.borderRadius,
              onTap: () {
                viewedRecentlyProvider.addToViewedRecentlyList(productId);
                Navigator.pushNamed(context, ProductDetails.routName,
                    arguments: productProvider);
              },
              child: Column(
                children: [
                  Stack(children: [
                    CustomFancyShimmerImage(image: productProvider.image),
                    Positioned(
                      top: 1,
                      right: 1,
                      child: Material(
                        elevation: 5,
                        color: Theme.of(context).dividerColor,
                        borderRadius: ConstValues.borderRadius,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          decoration: BoxDecoration(
                            color: Theme.of(context).dividerColor,
                            borderRadius: ConstValues.borderRadius,
                          ),
                          child: Row(
                            children: [
                              CustomText(
                                title: '${productProvider.rating}',
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              Icon(
                                IconlyBold.star,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Theme.of(context).dividerColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              title: productProvider.title,
                              color: fontColor,
                              fontSize: 23,
                            ),
                            const Spacer(),
                            IconButton(
                              icon: Icon(
                                color: Colors.red,
                                favouriteProvider.productInFavouriteList(
                                        productId: productId)
                                    ? IconlyBold.heart
                                    : IconlyBroken.heart,
                              ),
                              onPressed: () {
                                favouriteProvider
                                    .addAndRemoveToFavouriteList(productId);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.06,
                        ),
                        CustomText(
                          title: productProvider.category,
                          color: fontColor,
                          fontSize: 20,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.06,
                        ),
                        CustomText(
                          title: productProvider.description,
                          color: fontColor,
                          fontSize: 18,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.06,
                        ),
                        Row(
                          children: [
                            CustomText(
                              title: '${productProvider.price}\$',
                              color: fontColor,
                              fontSize: 20,
                            ),
                            const Spacer(),
                            Material(
                              shape: const OutlineInputBorder(
                                borderRadius: ConstValues.borderRadius,
                              ),
                              elevation: 5,
                              color: Theme.of(context).dividerColor,
                              child: IconButton(
                                onPressed: () {
                                  cartProvider.addAndRemoveToCart(productId);
                                },
                                icon: Icon(
                                  cartProvider.productInCart(
                                          productId: productId)
                                      ? IconlyBroken.shieldDone
                                      : IconlyBroken.buy,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
