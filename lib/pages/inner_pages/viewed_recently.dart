import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/viewed_recently_provider.dart';
import 'package:store/utils/assets_manger/assets_manger.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';
import 'package:store/widgets/other_widgets/empty_page.dart';
import 'package:store/widgets/other_widgets/shimmer_text.dart';
import 'package:store/widgets/search_widgets/custom_product_view.dart';

class ViewedRecently extends StatelessWidget {
  const ViewedRecently({super.key});
  final bool isEmpty = false;
  static const String routName = '/viewed_recently';
  @override
  Widget build(BuildContext context) {
    final viewedRecentlyProvider = Provider.of<ViewedRecentlyProvider>(context);
    return viewedRecentlyProvider.getViewedRecentlyList.isEmpty
        ? EmptyPage(
            appBarTitle: 'Viewed Recently',
            title: 'Your Viewed Recently is empty',
            subTitle:
                'looks like you have not added anything to your cart \n Go ahead & explore top categories',
            image: AssetsManger.orderBag,
          )
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                title: ShimmerText(
                  child: CustomText(
                    title:
                        'ViewedRecently (${viewedRecentlyProvider.getViewedRecentlyList.length})',
                    fontSize: 16,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      viewedRecentlyProvider.removeAll();
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
                      15, // المسافة بين العناصر عبر المحور الرئيسي (العمودي في حالتنا)
                  mainAxisSpacing:
                      20, // المسافة بين العناصر عبر المحور الثانوي (الأفقي في حالتنا)
                  // النسبة بين عرض وارتفاع العنصر
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                itemCount: viewedRecentlyProvider.getViewedRecentlyList.length,
                itemBuilder: (context, index) => CustomProductView(
                  productId: viewedRecentlyProvider.getViewedRecentlyList.values
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
