import 'dart:io';

import 'package:app/modles/cart.dart';
import 'package:app/modles/coustem.dart';
import 'package:app/modles/produc.dart';

class CoustomerControl {
  static List<Coustomer> _allCoustmer = [];
  File file = File("../data/coutum.json");
  List<Map<String, dynamic>> data = [
    {
      "id": "2",
      "name": "Bader Alsadi",
      "cellPhone": "774541450",
      "emali": "baderalsadi@gmail.com",
      "imagePath": "assets/image/index.jpeg"
    }
  ];

  getAllCoustem() {
    data.forEach((element) {
      Coustomer model = Coustomer.fromJson(element);
      _allCoustmer.add(model);
    });
  }

  addItemTocart ({required Coustomer  coustomer,required ProductModel product,required int Qounity})
  {
    int index = _allCoustmer.indexWhere((element) => element.id==coustomer.id);
    if(index!=-1){
      _allCoustmer[index].listCart.add(CartItem(product: product, coustomer: _allCoustmer[index], Qounity: Qounity));
       print("found");
    }
    else{
      print("not found");
    }



  }

  removeItemTocart ({required Coustomer  coustomer,required ProductModel product,required int Qounity})
  {
    int index = _allCoustmer.indexWhere((element) => element.id==coustomer.id );
    if(!_allCoustmer[index].listCart.isEmpty){
      _allCoustmer[index].listCart.removeWhere((element) => element.product.id==product.id);
    }
    else{
      print("not found");
    }
  }
  List<Coustomer> get coustomers=>_allCoustmer;
}
