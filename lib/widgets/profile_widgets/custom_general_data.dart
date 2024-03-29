import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/pages/auth_pages/log_in_page.dart';
import 'package:store/pages/inner_pages/viewed_recently.dart';
import 'package:store/providers/viewed_recently_provider.dart';
import 'package:store/utils/assets_manger/assets_manger.dart';
import 'package:store/utils/methods/app_methods.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';
import 'package:store/widgets/profile_widgets/custom_list_title.dart';
import 'package:store/widgets/profile_widgets/switch_button.dart';

class CustomGeneralData extends StatelessWidget {
  const CustomGeneralData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewedRecentlyProvider = Provider.of<ViewedRecentlyProvider>(context);
    final auth = FirebaseAuth.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomListTitle(
          onTap: () => Navigator.pushNamed(context, ViewedRecently.routName),
          image: AssetsManger.recent,
          title: Row(
            children: [
              const CustomText(
                title: 'Viewed recently',
                fontSize: 15,
              ),
              const Spacer(),
              if (viewedRecentlyProvider.getViewedRecentlyList.isNotEmpty)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(80)),
                    color: Theme.of(context).dividerColor,
                  ),
                  child: CustomText(
                    title: viewedRecentlyProvider.getViewedRecentlyList.length
                        .toString(),
                    fontSize: 15,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
            ],
          ),
        ),
        CustomListTitle(
          onTap: () {},
          image: AssetsManger.address,
          title: const CustomText(
            title: 'Address',
            fontSize: 15,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 5, bottom: 10),
          child: Divider(),
        ),
        const CustomText(title: 'Setting'),
        const SizedBox(
          height: 10,
        ),
        const CustomSwitchThemesButton(),
        CustomListTitle(
          image: auth.currentUser == null
              ? AssetsManger.login
              : AssetsManger.logout,
          title: CustomText(
            title: auth.currentUser == null ? 'Log in' : 'Log out',
            fontSize: 15,
          ),
          onTap: () async {
            await AppMethods.showMessageDialog(
              context: context,
              message: auth.currentUser == null
                  ? 'Are you sure?'
                  : 'Do you want to log out?',
              onPressed: () async {
                if (auth.currentUser != null) {
                  try {
                    await FirebaseAuth.instance.signOut();
                  } on FirebaseAuthException catch (error) {
                    if (!context.mounted) return;
                    await AppMethods.showMessageDialog(
                        context: context, message: error.code);
                  }
                }
                if (!context.mounted) return;
                Navigator.pushReplacementNamed(context, LogInPage.routName);
              },
            );
          },
        ),
        const Padding(
          padding: EdgeInsets.only(top: 5, bottom: 10),
          child: Divider(),
        ),
        const CustomText(title: 'Others'),
        CustomListTitle(
          onTap: () {},
          image: AssetsManger.privacy,
          title: const CustomText(
            title: 'Privacy & Policy',
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
