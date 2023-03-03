import 'package:flutter/material.dart';

class BaseViewModel with ChangeNotifier {
  void refreshView() {
    notifyListeners();
  }
}
