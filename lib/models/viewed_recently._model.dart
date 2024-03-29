import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class ViewedRecentlyListModel {
  final String wishListId, productId;
  ViewedRecentlyListModel({required this.productId}) : wishListId = uuid.v4();
}
