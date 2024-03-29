import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/favourite_provider.dart';
import 'package:store/utils/assets_manger/assets_manger.dart';
import 'package:store/utils/methods/app_methods.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';
import 'package:store/widgets/other_widgets/empty_page.dart';
import 'package:store/widgets/other_widgets/shimmer_text.dart';
import 'package:store/widgets/search_widgets/custom_product_view.dart';

class FavouriteList extends StatelessWidget {
  const FavouriteList({super.key});
  static const String routName = '/favourite_list';
  @override
  Widget build(BuildContext context) {
    final favouriteListProvider = Provider.of<FavouriteListProvider>(context);
    return favouriteListProvider.getFavouriteList.isEmpty
        ? EmptyPage(
            appBarTitle: 'Favourite List',
            title: 'Your Favourite List is empty',
            subTitle:
                'looks like you have not added anything to your Favourite list \n Go ahead & explore top categories',
            image: AssetsManger.bagWish,
          )
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                title: ShimmerText(
                  child: CustomText(
                    title:
                        'Favourite List (${favouriteListProvider.getFavouriteList.length})',
                    fontSize: 16,
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
                            favouriteListProvider.removeAll();
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
              body: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // تحديد عدد العناصر في الصف الواحد
                  crossAxisSpacing:
                      10, // المسافة بين العناصر عبر المحور الرئيسي (العمودي في حالتنا)
                  mainAxisSpacing:
                      10, // المسافة بين العناصر عبر المحور الثانوي (الأفقي في حالتنا)
                  // النسبة بين عرض وارتفاع العنصر
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                itemCount: favouriteListProvider.getFavouriteList.length,
                itemBuilder: (context, index) => CustomProductView(
                  productId: favouriteListProvider.favouriteList.values
                      .toList()
                      .reversed
                      .toList()[index]
                      .productId,
                ),
              ),
            ),
          );
  }
}
