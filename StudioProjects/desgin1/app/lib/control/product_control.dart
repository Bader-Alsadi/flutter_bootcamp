import 'package:app/models/product.dart';

class ProductControl {
  // List<Product> _allProudct= [];

  List<Product> getData(){
    return List.generate(20, (index) => Product(name: "proudct${index +1}", descrption: "descrption proudct ${index +1}"));
  }
}