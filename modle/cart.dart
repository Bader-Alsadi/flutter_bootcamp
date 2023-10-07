import 'package:app/modle/coustem.dart';
import 'package:app/modle/produc.dart';

class CartItem {
  late String id;
  late Coustomer coustomer;
  late ProductModel product;
  late int currintPrice;
  late int Qounity;

  CartItem({required this.product,required this.coustomer,required this.Qounity}){
    this.currintPrice=product.price!;
  }
}