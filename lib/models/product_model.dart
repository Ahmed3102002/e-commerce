import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class ProductModel {
  final String id, title, image, description, category;
  final int quantity;
  final double price, rating;

  ProductModel({
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.category,
    required this.quantity,
    required this.rating,
  }) : id = uuid.v4();
}
