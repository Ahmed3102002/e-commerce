import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product_model.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/utils/assets_manger/assets_manger.dart';
import 'package:store/widgets/custom_text_forms/search_text_form.dart';
import 'package:store/widgets/other_widgets/custom_app_bar.dart';
import 'package:store/widgets/other_widgets/empty_bag.dart';
import 'package:store/widgets/search_widgets/custom_product_view.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static const String routName = '/search_page';
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  List<ProductModel> searchList = [];
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final String? categoryName =
        ModalRoute.of(context)!.settings.arguments as String?;
    List<ProductModel> productList = productProvider.products;
    return Scaffold(
      appBar: CustomAppBar(title: categoryName ?? 'Store Products'),
      body: productList.isEmpty
          ? EmptyBag(
              image: AssetsManger.emptySearch,
              title: 'There is no items in this Category ',
              subTitle: 'try another one',
            )
          : ListView(
              children: [
                SearchTextForm(
                  searchController: _searchController,
                  onChanged: (value) {
                    setState(() {
                      searchList = productProvider.searchByName(
                          searchName: _searchController.text,
                          searchIn: productList);
                    });
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      searchList = productProvider.searchByName(
                          searchName: _searchController.text,
                          searchIn: productList);
                    });
                    FocusScope.of(context).unfocus();
                  },
                ),
                if (_searchController.text.isNotEmpty &&
                    searchList.isEmpty) ...{
                  EmptyBag(
                    image: AssetsManger.emptySearch,
                    title: 'There is no items in this Category ',
                    subTitle: 'try another one',
                  )
                },
                GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // تحديد عدد العناصر في الصف الواحد
                    crossAxisSpacing:
                        15, // المسافة بين العناصر عبر المحور الرئيسي (العمودي في حالتنا)
                    mainAxisSpacing:
                        20, // المسافة بين العناصر عبر المحور الثانوي (الأفقي في حالتنا)
                    // النسبة بين عرض وارتفاع العنصر
                  ),
                  itemCount: _searchController.text.isEmpty
                      ? productList.length
                      : searchList.length,
                  itemBuilder: (context, index) {
                    return CustomProductView(
                        productId: _searchController.text.isEmpty
                            ? productList[index].id
                            : searchList[index].id);
                  },
                )
              ],
            ),
    );
  }
}
