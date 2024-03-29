import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product_model.dart';
import 'package:store/pages/cart_page.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/providers/favourite_provider.dart';
import 'package:store/utils/constant/const_values.dart';
import 'package:store/widgets/auth_widgets/custom_elevated_button_with_icon.dart';
import 'package:store/widgets/other_widgets/custom_fancy_shimmer_image.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';
import 'package:store/widgets/other_widgets/shimmer_text.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  static const String routName = '/product_details';
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final defaultColor = Theme.of(context).dividerColor;
    final favouriteProvider = Provider.of<FavouriteListProvider>(context);
    final double height = MediaQuery.of(context).size.height;
    final ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const ShimmerText(
            child: CustomText(
              title: 'SmartShop',
              fontSize: 20,
            ),
          ),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Badge(
                  alignment: Alignment.topLeft,
                  label: CustomText(
                    title: '${cartProvider.getCarts.length}',
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  backgroundColor: defaultColor,
                  child: Material(
                    elevation: 5,
                    color: defaultColor,
                    borderRadius: ConstValues.borderRadius,
                    child: IconButton(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      icon: const Icon(
                        IconlyBroken.buy,
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, CartPage.routName),
                    ),
                  )),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              Material(
                shadowColor: defaultColor,
                elevation: 5,
                borderRadius: ConstValues.borderRadius,
                child: CustomFancyShimmerImage(
                  image: product.image,
                  borderRadius: ConstValues.borderRadius,
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(
                    title: product.title,
                    fontSize: 18,
                  ),
                  const Spacer(),
                  CustomText(
                    title: '\$${product.price}',
                    fontSize: 18,
                    color: Colors.pinkAccent,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomText(
                title: product.category,
                fontSize: 18,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Material(
                      borderOnForeground: false,
                      elevation: 5,
                      color: defaultColor,
                      shape: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: ConstValues.borderRadius,
                      ),
                      child: IconButton(
                        onPressed: () {
                          favouriteProvider
                              .addAndRemoveToFavouriteList(product.id);
                        },
                        icon: Icon(
                          favouriteProvider.productInFavouriteList(
                                  productId: product.id)
                              ? IconlyBold.heart
                              : IconlyBroken.heart,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const Spacer(),
                    CustomElvatedButtonWithIcon(
                      onPressed: () {
                        cartProvider.addAndRemoveToCart(product.id);
                      },
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10),
                      icon: cartProvider.productInCart(productId: product.id)
                          ? IconlyBroken.shieldDone
                          : IconlyBroken.buy,
                      title: cartProvider.productInCart(productId: product.id)
                          ? 'Already in cart'
                          : 'Add to cart',
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                children: [
                  CustomText(
                    title: 'About this item',
                    color: Theme.of(context).dividerColor,
                    fontSize: 16,
                  ),
                  const Spacer(),
                  CustomText(
                    title: 'In Accessories',
                    color: Theme.of(context).dividerColor,
                    fontSize: 16,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              CustomText(
                title: product.description,
                color: Theme.of(context).dividerColor,
                maxLines: 11,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              CustomText(
                title: 'Rating',
                color: Theme.of(context).dividerColor,
                fontSize: 16,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Center(
                child: CustomText(
                  title: '${product.rating}',
                  color: Theme.of(context).dividerColor,
                  fontSize: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    IconlyBold.star,
                    color: Theme.of(context).dividerColor,
                  ),
                  Icon(
                    IconlyBold.star,
                    color: Theme.of(context).dividerColor,
                  ),
                  Icon(
                    IconlyBold.star,
                    color: Theme.of(context).dividerColor,
                  ),
                  Icon(
                    IconlyBold.star,
                    color: Theme.of(context).dividerColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
