import 'dart:math';

import 'package:app/day74/featuer/model/product_model.dart';
import 'package:get/state_manager.dart';

class ProductVM extends GetxController {
  List<Product> allproduct = [];
  List<Product> whishList = [];
  ProductVM() {
    allproduct = List.generate(
        10,
        (index) => Product(
            name: "product ${index + 1}", price: Random().nextInt(50) + 500));
  }

  AddtowhishLis(Product p) {
    whishList.add(p);
    update();
  }

  removeowhishLis(Product p) {
    whishList.remove(p);
    update();
  }
}
