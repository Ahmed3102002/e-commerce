import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/all_orders_provider.dart';
import 'package:store/utils/assets_manger/assets_manger.dart';
import 'package:store/utils/methods/app_methods.dart';
import 'package:store/widgets/cart_widgets/custom_cart.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';
import 'package:store/widgets/other_widgets/empty_page.dart';
import 'package:store/widgets/other_widgets/shimmer_text.dart';

class AllOrders extends StatelessWidget {
  const AllOrders({super.key});
  static const String routName = 'all_orders_page';
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final allOrdersProvider = Provider.of<AllOrdersProvider>(context);
    return allOrdersProvider.getAllOrdersList.isEmpty
        ? EmptyPage(
            appBarTitle: 'All Orders',
            title: 'Your do`t have any Orders yet',
            subTitle:
                'looks like you have not added anything to your cart \n Go ahead & explore top categories',
            image: AssetsManger.orderBag,
          )
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: ShimmerText(
                  child: CustomText(
                    title:
                        'All Orders (${allOrdersProvider.getAllOrdersList.length})',
                    fontSize: 20,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      AppMethods.showMessageDialog(
                          context: context,
                          message: 'Are you sure to delete All items ?',
                          titl1: 'No',
                          title2: 'Yes',
                          onPressed: () {
                            allOrdersProvider.removeAll();
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
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                itemCount: allOrdersProvider.getAllOrdersList.length,
                itemBuilder: (context, index) => CustomCart(
                  productId: allOrdersProvider.getAllOrdersList.values
                      .toList()
                      .reversed
                      .toList()[index]
                      .productId,
                  onPressed: () => allOrdersProvider.removeFromAllOrdersList(
                    productId: allOrdersProvider.getAllOrdersList.values
                        .toList()
                        .reversed
                        .toList()[index]
                        .productId,
                  ),
                ),
              ),
            ),
          );
  }
}
