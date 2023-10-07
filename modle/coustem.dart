import 'package:app/modle/cart.dart';

class Coustomer{
late String id, name,cellPhone;
String? emali,imagePath;
List<CartItem> listCart=[];
// ;

Coustomer({required this.name,required this.cellPhone});

Coustomer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cellPhone = json['cellPhone'];
    emali = json['emali'];
    imagePath = json['imagePath'];
  }

}