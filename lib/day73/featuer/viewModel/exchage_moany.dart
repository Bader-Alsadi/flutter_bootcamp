import 'dart:ffi';

import 'package:app/day73/featuer/models/Curremcy_model.dart';
import 'package:flutter/foundation.dart';

class ExchangeMaonyVM with ChangeNotifier {
  double rialY = 0.0;

  double get getRialY => this.rialY;

  set setRialY(double rialY) {
    this.rialY = rialY;
    notifyListeners();
  }

  List<Currency> currencyList = [
    Currency(name: "RS", value: 450),
    Currency(name: "US", value: 1200),
    Currency(name: "ER", value: 1300),
  ];

  toggleCurrency(int index) {
    currencyList[index].isActive = !currencyList[index].isActive;
    notifyListeners();
  }
}
