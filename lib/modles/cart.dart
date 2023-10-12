import 'package:app/modles/coustem.dart';
import 'package:app/modles/produc.dart';

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