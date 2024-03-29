import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class FavouriteList {
  final String favouriteListId, productId;
  FavouriteList({required this.productId})
      : favouriteListId = uuid.v4.toString();
}
