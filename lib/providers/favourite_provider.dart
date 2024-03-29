import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store/models/favourite_list_model.dart';

class FavouriteListProvider with ChangeNotifier {
  final Map<String, FavouriteList> favouriteList = {};
  Map<String, FavouriteList> get getFavouriteList {
    return favouriteList;
  }

  bool productInFavouriteList({required String productId}) {
    return favouriteList.containsKey(productId);
  }

  void addAndRemoveToFavouriteList(String productId) {
    if (FirebaseAuth.instance.currentUser != null) {
      if (favouriteList.containsKey(productId)) {
        favouriteList.remove(
          productId,
        );
      } else {
        favouriteList.putIfAbsent(
          productId,
          () => FavouriteList(
            productId: productId,
          ),
        );
      }
      notifyListeners();
    }
  }

  void removeFromFavouriteList({required String productId}) {
    favouriteList.remove(
      productId,
    );
    notifyListeners();
  }

  void removeAll() {
    favouriteList.clear();
    notifyListeners();
  }
}
