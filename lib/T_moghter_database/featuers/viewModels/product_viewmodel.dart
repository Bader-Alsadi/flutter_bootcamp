import 'package:app/T_moghter_database/core/helper/repositeries/product_repo.dart';
import 'package:app/T_moghter_database/featuers/models/product_model.dart';

class ProductViewmodel{
  List<Product> allProducte=[];
  Future<List<Product>>fetchProduct (ProductREPO productREPO)async{
    List<dynamic> products=await productREPO.getProduct();
    allProducte = products.map((e) => Product.fromJson(e)).toList();
    return allProducte;
  }
}