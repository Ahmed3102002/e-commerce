import 'package:flutter/material.dart';
import 'package:store/models/all_orders_model.dart';

class AllOrdersProvider with ChangeNotifier {
  final Map<String, AllOrdersModel> allOrdersList = {};
  Map<String, AllOrdersModel> get getAllOrdersList {
    return allOrdersList;
  }

  bool productInAllOrdersList({required String productId}) {
    return allOrdersList.containsKey(productId);
  }

  void addToAllOrdersList(String productId) {
    allOrdersList.putIfAbsent(
      productId,
      () => AllOrdersModel(
        productId: productId,
      ),
    );

    notifyListeners();
  }

  void removeFromAllOrdersList({required String productId}) {
    allOrdersList.remove(
      productId,
    );
    notifyListeners();
  }

  void removeAll() {
    allOrdersList.clear();
    notifyListeners();
  }
}
