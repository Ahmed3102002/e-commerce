import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class AllOrdersModel {
  final String allOrdersListId, productId;
  AllOrdersModel({
    required this.productId,
  }) : allOrdersListId = uuid.v4.toString();
}
