import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store/pages/inner_pages/all_orders.dart';
import 'package:store/pages/inner_pages/favourite_list.dart';
import 'package:store/providers/all_orders_provider.dart';
import 'package:store/providers/favourite_provider.dart';
import 'package:store/providers/user_info_provider.dart';
import 'package:store/utils/assets_manger/assets_manger.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';
import 'package:store/widgets/profile_widgets/custom_list_title.dart';

class CustomUserData extends StatelessWidget {
  const CustomUserData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserInfoProvider>(context);
    final favouriteListProvider = Provider.of<FavouriteListProvider>(context);
    final allOrdersProvider = Provider.of<AllOrdersProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pinkAccent, width: 3),
                borderRadius: BorderRadius.circular(100),
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  userInfo.userInfo?.userImage ??
                      'https://img.favpng.com/4/1/19/computer-icons-user-profile-computer-software-png-favpng-7ujTL6FqkdsYJh37sSpqEZgZH.jpg',
                ),
                radius: 50,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: userInfo.userInfo?.userName ?? 'User Name',
                  fontSize: 18,
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomText(
                    fontSize: 16,
                    title: userInfo.userInfo?.userEmail ?? 'user@gmail.com'),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: Icon(
                IconlyBroken.editSquare,
                color: Theme.of(context).dividerColor,
              ),
              onPressed: () {},
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomText(title: 'General'),
        const SizedBox(
          height: 10,
        ),
        CustomListTitle(
          onTap: () => Navigator.pushNamed(context, AllOrders.routName),
          image: AssetsManger.orderSvg,
          title: Row(
            children: [
              const CustomText(
                title: 'All Orders',
                fontSize: 15,
              ),
              const Spacer(),
              if (allOrdersProvider.getAllOrdersList.isNotEmpty)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(80)),
                    color: Theme.of(context).dividerColor,
                  ),
                  child: CustomText(
                    title: allOrdersProvider.getAllOrdersList.length.toString(),
                    fontSize: 15,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
            ],
          ),
        ),
        CustomListTitle(
          onTap: () => Navigator.pushNamed(context, FavouriteList.routName),
          image: AssetsManger.wishlistSvg,
          title: Row(
            children: [
              const CustomText(
                title: 'Favourite List',
                fontSize: 15,
              ),
              const Spacer(),
              if (favouriteListProvider.getFavouriteList.isNotEmpty)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(80)),
                    color: Theme.of(context).dividerColor,
                  ),
                  child: CustomText(
                    title: favouriteListProvider.getFavouriteList.length
                        .toString(),
                    fontSize: 15,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
