import 'dart:math';

class Product {
  late String name, descrption;
  late double price;
  bool isCheak = false;

  Product({
    required this.name,
    required this.descrption,
  }) {
    this.price = Random().nextDouble() * 1000 + 1;
  }
}
