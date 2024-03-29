import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfoModel {
  final String userName, userImage, userEmail, userId;
  final List userCart, userFavouriteList;
  final Timestamp createdAt;

  UserInfoModel(
      {required this.userId,
      required this.userEmail,
      required this.userCart,
      required this.userFavouriteList,
      required this.createdAt,
      required this.userImage,
      required this.userName});

  factory UserInfoModel.fromjson(Map<String, dynamic> data) {
    return UserInfoModel(
        userName: data['userName'],
        userEmail: data['userEmail'],
        userImage: data['userImage'],
        userId: data['userId'],
        userCart: data['userCart'],
        userFavouriteList: data['userFavouriteList'],
        createdAt: data['createdAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userImage': userImage,
      'userId': userId,
      'userCart': userCart,
      'userFavouriteList': userFavouriteList,
      'createdAt': createdAt,
    };
  }
}
