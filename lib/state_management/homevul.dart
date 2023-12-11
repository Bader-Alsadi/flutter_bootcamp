import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Homev with ChangeNotifier {
  List<dynamic> _allProduct = [];
  int _number = 0;

  int get number => this._number;

  set number(int value) => this._number = value;

  loodProduct() async {
    Dio dio = Dio();

    final response = await dio.get("https://dummyjson.com/products");

    _allProduct = response.data["productes"];

    notifyListeners();
  }

  addnewProduct(Map<String, dynamic> p) {
    _allProduct.add(p);
    notifyListeners();
  }

  List<dynamic> getNumber() {
    return _allProduct;
  }
}
