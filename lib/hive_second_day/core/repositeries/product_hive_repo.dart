import 'package:app/hive_second_day/core/helper/Hive_he;per.dart';
import 'package:app/hive_second_day/core/repositeries/product_repo.dart';
import 'package:app/hive_second_day/featuer/model/product_modle.dart';

class ProductHiveRepo extends ProductREP{
  @override
  List<Product> dataToproduct(data) {
    List<Product> products= (data as Iterable).toList() as List<Product>; 
    return products;
  }

  @override
  Future<List<Product>> getProduct(String source) async{
    HiveHelper HH = HiveHelper(source);

    return await dataToproduct(HH.feach());

  }

  @override
  storgeProduct(String source) {
    // TODO: implement storgeProduct
    throw UnimplementedError();
  }

}