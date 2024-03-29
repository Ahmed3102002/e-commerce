import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product_model.dart';
import 'package:store/pages/inner_pages/product_details.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/providers/favourite_provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/providers/theme_provider.dart';
import 'package:store/providers/viewed_recently_provider.dart';
import 'package:store/utils/constant/const_values.dart';
import 'package:store/widgets/cart_widgets/quantity_bottom_sheet.dart';
import 'package:store/widgets/other_widgets/custom_fancy_shimmer_image.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

import '../../utils/colors/app_colors.dart';

class CustomCart extends StatelessWidget {
  const CustomCart(
      {super.key, required this.productId, required this.onPressed});

  final String productId;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final viewedRecentlyProvider = Provider.of<ViewedRecentlyProvider>(context);
    final ProductModel? productProvider =
        Provider.of<ProductProvider>(context).findProduct(productId);
    final favouriteProvider = Provider.of<FavouriteListProvider>(context);
    final theme = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    final Color fontColor = Theme.of(context).scaffoldBackgroundColor;
    final Color cartColor = Theme.of(context).dividerColor;
    final cartProvider = Provider.of<CartProvider>(context);
    return productProvider == null
        ? const SizedBox.shrink()
        : FittedBox(
            child: GestureDetector(
              onTap: () {
                viewedRecentlyProvider.addToViewedRecentlyList(productId);
                Navigator.pushNamed(context, ProductDetails.routName,
                    arguments: productProvider);
              },
              child: Material(
                elevation: 5,
                borderRadius: ConstValues.borderRadius,
                color: Colors.transparent,
                shadowColor: cartColor,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: ConstValues.borderRadius,
                    color: cartColor,
                  ),
                  child: Row(
                    children: [
                      CustomFancyShimmerImage(
                        image: productProvider.image,
                        width: size.width * 0.4,
                        height: size.width * 0.4,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Column(
                        children: [
                          CustomText(
                            title: productProvider.title,
                            color: fontColor,
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          CustomText(
                            title: '${productProvider.price}\$',
                            color: fontColor,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: onPressed,
                              icon: Icon(
                                IconlyBroken.delete,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                favouriteProvider
                                    .addAndRemoveToFavouriteList(productId);
                              },
                              icon: Icon(
                                favouriteProvider.productInFavouriteList(
                                        productId: productId)
                                    ? IconlyBold.heart
                                    : IconlyBroken.heart,
                                color: Colors.red,
                              ),
                            ),
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                elevation: 3,
                                backgroundColor: theme.getIsDarkTheme
                                    ? AppColors.darkPrimaryColor
                                    : AppColors.lightPrimaryColor,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: theme.getIsDarkTheme
                                        ? AppColors.lightPrimaryColor
                                        : AppColors.darkPrimaryColor,
                                  ),
                                  borderRadius: ConstValues.borderRadius,
                                ),
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  context: context,
                                  builder: (context) {
                                    return QuantityButtomSheet(
                                      productId: productId,
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                IconlyBroken.arrowDown2,
                                color: Theme.of(context).dividerColor,
                              ),
                              label: CustomText(
                                title:
                                    'Quantity: ${cartProvider.getCarts[productId]?.quantity}',
                                color: Theme.of(context).dividerColor,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
