import 'package:flutter/material.dart';
import 'package:store/models/category_model.dart';
import 'package:store/pages/auth_pages/forget_password_page.dart';
import 'package:store/pages/auth_pages/log_in_page.dart';
import 'package:store/pages/auth_pages/sign_up_page.dart';
import 'package:store/pages/cart_page.dart';
import 'package:store/pages/home_page.dart';
import 'package:store/pages/inner_pages/all_orders.dart';
import 'package:store/pages/inner_pages/product_details.dart';
import 'package:store/pages/inner_pages/viewed_recently.dart';
import 'package:store/pages/inner_pages/favourite_list.dart';
import 'package:store/pages/profile_page.dart';
import 'package:store/pages/search_page.dart';
import 'package:store/root_of_pages.dart';
import 'package:store/utils/assets_manger/assets_manger.dart';

class ConstValues {
  static Map<String, Widget Function(BuildContext)> routes = {
    ProductDetails.routName: (context) => const ProductDetails(),
    FavouriteList.routName: (context) => const FavouriteList(),
    ViewedRecently.routName: (context) => const ViewedRecently(),
    LogInPage.routName: (context) => const LogInPage(),
    RootOfPages.routName: (context) => const RootOfPages(),
    SignUpPage.routName: (context) => const SignUpPage(),
    AllOrders.routName: (context) => const AllOrders(),
    ForgetPasswordPage.routName: (context) => const ForgetPasswordPage(),
    SearchPage.routName: (context) => const SearchPage(),
    CartPage.routName: (context) => const CartPage(),
  };
  static const borderRadius = BorderRadius.all(Radius.circular(20));
  static List<CategoryModel> categoriesList = [
    CategoryModel(
      id: "Phones",
      image: AssetsManger.mobiles,
      name: "Phones",
    ),
    CategoryModel(
      id: "Laptops",
      image: AssetsManger.pc,
      name: "Laptops",
    ),
    CategoryModel(
      id: "Electronics",
      image: AssetsManger.electronics,
      name: "Electronics",
    ),
    CategoryModel(
      id: "Watches",
      image: AssetsManger.watch,
      name: "Watches",
    ),
    CategoryModel(
      id: "Clothes",
      image: AssetsManger.fashion,
      name: "Clothes",
    ),
    CategoryModel(
      id: "Shoes",
      image: AssetsManger.shoes,
      name: "Shoes",
    ),
    CategoryModel(
      id: "",
      image: AssetsManger.book,
      name: "Books",
    ),
    CategoryModel(
      id: "Cosmetics",
      image: AssetsManger.cosmetics,
      name: "Cosmetics",
    ),
  ];
  static List<String> bannersImages = [
    AssetsManger.banner1,
    AssetsManger.banner2
  ];
  static List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const CartPage(),
    const ProfilePage()
  ];
  static final Map<String, String> authVariables = {
    'signup': 'SignUp',
    'login': 'LogIn',
    'forgetpassword': 'Forget Password',
    'smartshop': 'Shop Smart',
    "name": "Name",
    'email': 'Email',
    'password': 'Password',
    'requestlink': 'Request link',
    'resethintmessage': 'enter your email address to rest your password',
  };
  static const String apiLink = 'https://fakestoreapi.com';
}
