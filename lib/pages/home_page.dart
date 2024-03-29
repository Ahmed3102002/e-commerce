import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/utils/constant/const_values.dart';
import 'package:store/widgets/home_widgets/custom_categories.dart';
import 'package:store/widgets/home_widgets/custom_lastest_products.dart';
import 'package:store/widgets/home_widgets/custom_swiper_images.dart';
import 'package:store/widgets/other_widgets/custom_app_bar.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final ProductProvider productProvider =
        Provider.of<ProductProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'ShopSmart'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              const CustomSwiperImages(),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02),
                child: const CustomText(
                  title: 'Lastest arrival',
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: productProvider.products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return CustomLastestProducts(
                      productModel: productProvider.products[index],
                    );
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02),
                child: const CustomText(
                  title: 'Categories',
                  fontSize: 20,
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(8.0),
                itemCount: ConstValues.categoriesList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20, crossAxisCount: 5),
                itemBuilder: ((context, index) {
                  return CustomCategories(
                    categoryName: ConstValues.categoriesList[index].name,
                    image: ConstValues.categoriesList[index].image,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
