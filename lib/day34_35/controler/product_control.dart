import 'package:app/day34_35/models/product.dart';

class ProductControl {
  // List<Product> _allProudct= [];

  List<Product> getData() {
    
    return List.generate(
        20,
        (index) => Product(
            name: "proudct${index + 1}",
            descrption: "descrption proudct ${index + 1}"));
  }

  List<Product> editData(
      {required List<Product> productList, required List<Product> cartItems}) {
    cartItems.forEach((element) {
      productList[productList.indexOf(element)].isCheak = true;
    });
    return productList;
  }

  double getTotal({required List<Product> cartItems}) {
    return cartItems.isNotEmpty
        ? cartItems
            .map((e) => e.price)
            .reduce((value, element) => value + element)
        : 0;
  }
}
