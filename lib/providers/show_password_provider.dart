import 'package:flutter/material.dart';

class ShowPasswordProvider with ChangeNotifier {
  bool isVisiable = false;
  bool get getShowPassword {
    return isVisiable;
  }

  void get showPassword async {
    isVisiable = !isVisiable;
    notifyListeners();
  }
}
