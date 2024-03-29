import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/firebase_options.dart';
import 'package:store/pages/auth_pages/log_in_page.dart';
import 'package:store/providers/all_orders_provider.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/providers/favourite_provider.dart';
import 'package:store/providers/is_loading_provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/providers/show_password_provider.dart';
import 'package:store/providers/theme_provider.dart';
import 'package:store/providers/user_info_provider.dart';
import 'package:store/providers/viewed_recently_provider.dart';
import 'package:store/utils/themes/dark_theme.dart';
import 'package:store/utils/themes/light_theme.dart';
import 'package:store/root_of_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'utils/constant/const_values.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => FavouriteListProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ShowPasswordProvider()),
        ChangeNotifierProvider(create: (context) => ViewedRecentlyProvider()),
        ChangeNotifierProvider(create: (context) => AllOrdersProvider()),
        ChangeNotifierProvider(create: (context) => IsLoadingProvider()),
        ChangeNotifierProvider(create: (context) => UserInfoProvider()),
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          routes: ConstValues.routes,
          debugShowCheckedModeBanner: false,
          theme: themeProvider.getIsDarkTheme
              ? DarkThemeData.themeData()
              : LightThemeData.themeData(),
          home: FirebaseAuth.instance.currentUser == null
              ? const LogInPage()
              : const RootOfPages(),
        );
      }),
    );
  }
}
