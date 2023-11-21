import 'package:app/hive_second_day/core/constane/API_url.dart';
import 'package:app/hive_second_day/core/repositeries/product_repo.dart';
import 'package:app/hive_second_day/featuer/model/product_modle.dart';

class ProductVM{
  List<Product> allProduct = [];
  Future<List<Product>> fetchProuctsFromRepo (ProductREP productREP,String source)async{
    List<dynamic> products= await productREP.getProduct(source);
    allProduct = products.map((e) => Product.fromJson(e)).toList();

    return allProduct;
  }
}