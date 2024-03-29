import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/utils/constant/const_values.dart';
import 'package:store/utils/methods/app_methods.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

class RootOfPages extends StatefulWidget {
  const RootOfPages({super.key});

  static const String routName = '/root_page';
  @override
  State<RootOfPages> createState() => _RootOfPagesState();
}

class _RootOfPagesState extends State<RootOfPages> {
  late PageController controller;

  @override
  void didChangeDependencies() {
    AppMethods.getUser(context);
    super.didChangeDependencies();
  }

  int initialPageIndex = 0;
  @override
  void initState() {
    controller = PageController(initialPage: initialPageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context).getCarts;
    List<NavigationDestination> destinations = [
      const NavigationDestination(
          selectedIcon: Icon(
            IconlyBold.home,
          ),
          icon: Icon(
            IconlyBroken.home,
          ),
          label: 'home'),
      const NavigationDestination(
        icon: Icon(
          IconlyBroken.search,
        ),
        label: 'search',
        selectedIcon: Icon(
          IconlyBold.search,
        ),
      ),
      NavigationDestination(
        icon: Badge(
          isLabelVisible: cartProvider.isNotEmpty,
          label: CustomText(
            title: '${cartProvider.length}',
            fontSize: 12,
            color: Colors.black,
          ),
          textColor: Colors.white,
          backgroundColor: Colors.white,
          child: const Icon(
            IconlyBroken.buy,
          ),
        ),
        label: 'cart',
        selectedIcon: Badge(
          label: CustomText(
            title: '${cartProvider.length}',
            fontSize: 12,
            color: Colors.black,
          ),
          textColor: Colors.black,
          backgroundColor: Colors.white,
          child: const Icon(
            IconlyBold.buy,
          ),
        ),
      ),
      const NavigationDestination(
        icon: Icon(
          IconlyBroken.profile,
        ),
        label: 'profile',
        selectedIcon: Icon(
          IconlyBold.profile,
        ),
      ),
    ];
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: controller,
          physics: const BouncingScrollPhysics(),
          children: ConstValues.pages,
        ),
        bottomNavigationBar: NavigationBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          selectedIndex: initialPageIndex,
          destinations: destinations,
          onDestinationSelected: (value) => setState(() {
            initialPageIndex = value;
            controller.jumpToPage(initialPageIndex);
          }),
        ),
      ),
    );
  }
}
