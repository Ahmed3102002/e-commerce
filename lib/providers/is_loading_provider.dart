import 'package:flutter/material.dart';

class IsLoadingProvider with ChangeNotifier {
  bool isLoading = false;
  bool get getLoadingState {
    return isLoading;
  }

  void get isLoadingChange {
    isLoading = !isLoading;
    notifyListeners();
  }
}
