import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class CartModel {
  final String cartId, productId;
  final int quantity;

  CartModel({required this.productId, required this.quantity})
      : cartId = uuid.v4.toString();
}
