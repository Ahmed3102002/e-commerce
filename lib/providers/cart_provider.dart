import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store/models/cart_model.dart';
import 'package:store/providers/product_provider.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> carts = {};
  Map<String, CartModel> get getCarts {
    return carts;
  }

  bool productInCart({required String productId}) {
    return carts.containsKey(productId);
  }

  void addAndRemoveToCart(String productId) {
    if (FirebaseAuth.instance.currentUser != null) {
      if (carts.containsKey(productId)) {
        carts.remove(
          productId,
        );
      } else {
        carts.putIfAbsent(
          productId,
          () => CartModel(productId: productId, quantity: 1),
        );
      }
      notifyListeners();
    }
  }

  void removeFromCart({required String productId}) {
    carts.remove(
      productId,
    );
    notifyListeners();
  }

  void removeAll() {
    carts.clear();
    notifyListeners();
  }

  void updateQuantity({required String productId, required int quantity}) {
    carts.update(
      productId,
      (item) => CartModel(productId: item.productId, quantity: quantity),
    );
    notifyListeners();
  }

  double getTotalCost({required ProductProvider productProvider}) {
    double totalCost = 0.0;
    carts.forEach(
      (key, value) {
        double productCost =
            productProvider.findProduct(value.productId)!.price;
        int cartQuantity = value.quantity;
        totalCost += productCost * cartQuantity.toDouble();
      },
    );
    return totalCost;
  }

  int getTotalQuantity() {
    int totalQuantity = 0;
    carts.forEach(
      (key, value) {
        int cartQuantity = value.quantity;
        totalQuantity += cartQuantity;
      },
    );
    return totalQuantity;
  }
}
