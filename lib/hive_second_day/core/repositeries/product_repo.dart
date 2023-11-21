import 'package:app/hive_second_day/featuer/model/product_modle.dart';

abstract class ProductREP{
  Future<List<Product>> getProduct(String source);
  storgeProduct(String source);

  List<Product> dataToproduct( data);
}