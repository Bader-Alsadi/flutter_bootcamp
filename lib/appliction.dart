import 'package:flutter/material.dart';

class ApplictioThem with ChangeNotifier {
  ThemeMode mode = ThemeMode.light;

  toggelThem(bool isdark) {
    mode = isdark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}
