import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/utils/assets_manger/assets_manger.dart';
import 'package:store/utils/methods/app_methods.dart';
import 'package:store/widgets/cart_widgets/bottom_check_out.dart';
import 'package:store/widgets/cart_widgets/custom_cart.dart';
import 'package:store/widgets/other_widgets/custom_app_bar.dart';
import 'package:store/widgets/other_widgets/empty_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static const String routName = '/cart_page';
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.getCarts.isEmpty
        ? EmptyPage(
            appBarTitle: 'Shop Smart',
            title: 'Your cart is empty',
            subTitle:
                'looks like you have not added anything to your cart \n Go ahead & explore top categories',
            image: AssetsManger.shoppingCart)
        : Scaffold(
            appBar: CustomAppBar(
              title: 'Shop Smart (${cartProvider.getCarts.length})',
              actions: [
                IconButton(
                  onPressed: () {
                    AppMethods.showMessageDialog(
                        context: context,
                        message: 'Are you sure to delete All items ?',
                        titl1: 'No',
                        title2: 'Yes',
                        onPressed: () {
                          cartProvider.removeAll();
                          Navigator.pop(context);
                        });
                  },
                  icon: Icon(
                    IconlyBroken.delete,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ],
            ),
            body: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              itemCount: cartProvider.getCarts.length,
              itemBuilder: (context, index) {
                return CustomCart(
                  onPressed: () => cartProvider.removeFromCart(
                      productId: cartProvider.getCarts.values
                          .toList()
                          .reversed
                          .toList()[index]
                          .productId),
                  productId: cartProvider.getCarts.values
                      .toList()
                      .reversed
                      .toList()[index]
                      .productId,
                );
              },
            ),
            bottomNavigationBar: const CartBottomCheckOut(),
          );
  }
}
