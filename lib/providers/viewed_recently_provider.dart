import 'package:flutter/material.dart';
import 'package:store/models/viewed_recently._model.dart';

class ViewedRecentlyProvider with ChangeNotifier {
  final Map<String, ViewedRecentlyListModel> viewedRecentlyList = {};
  Map<String, ViewedRecentlyListModel> get getViewedRecentlyList {
    return viewedRecentlyList;
  }

  bool productInViewedRecentlyList({required String productId}) {
    return viewedRecentlyList.containsKey(productId);
  }

  void addToViewedRecentlyList(String productId) {
    viewedRecentlyList.putIfAbsent(
      '$productId',
      () => ViewedRecentlyListModel(
        productId: productId,
      ),
    );

    notifyListeners();
  }

  void removeFromViewedRecentlyList({required String productId}) {
    viewedRecentlyList.remove(
      productId,
    );
    notifyListeners();
  }

  void removeAll() {
    viewedRecentlyList.clear();
    notifyListeners();
  }
}
