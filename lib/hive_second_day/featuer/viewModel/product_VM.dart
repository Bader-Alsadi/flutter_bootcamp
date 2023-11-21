import 'package:app/hive_second_day/core/repositeries/product_repo.dart';
import 'package:app/hive_second_day/featuer/model/product_modle.dart';

class ProductVM{
  List<Product> allProduct = [];
  Future<List<Product>> fetchProuctsFromRepo (ProductREP productREP,String source)async{
    allProduct =  await productREP.getProduct(source);
    

    return allProduct;
  }
}