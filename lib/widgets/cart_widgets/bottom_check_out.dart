import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/pages/inner_pages/all_orders.dart';
import 'package:store/providers/all_orders_provider.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/providers/theme_provider.dart';
import 'package:store/utils/colors/app_colors.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

class CartBottomCheckOut extends StatelessWidget {
  const CartBottomCheckOut({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final allOrdersProviders = Provider.of<AllOrdersProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border(
          top: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      padding: const EdgeInsets.only(top: 10.0, left: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title:
                      'Total ( ${cartProvider.getCarts.length} products of ${cartProvider.getTotalQuantity()} items )',
                  fontSize: 14,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  title:
                      '\$${cartProvider.getTotalCost(productProvider: productProvider)}',
                  color: const Color.fromARGB(255, 194, 177, 177),
                  fontSize: 18,
                )
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {
              if (FirebaseAuth.instance.currentUser != null) {
                cartProvider.getCarts.forEach((key, value) {
                  if (allOrdersProviders.productInAllOrdersList(
                      productId: value.productId)) {
                  } else {
                    allOrdersProviders.addToAllOrdersList(value.productId);
                    Navigator.pushNamed(context, AllOrders.routName);
                  }
                });
              }
            },
            style: OutlinedButton.styleFrom(
              elevation: 5,
              backgroundColor: theme.getIsDarkTheme
                  ? AppColors.lightPrimaryColor
                  : AppColors.darkPrimaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            child: CustomText(
              title: 'CheckOut',
              fontSize: 14,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          )
        ],
      ),
    );
  }
}
