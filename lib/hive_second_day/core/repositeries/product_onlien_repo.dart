import 'package:app/hive_second_day/core/repositeries/product_repo.dart';
import 'package:app/hive_second_day/featuer/model/product_modle.dart';
import 'package:dio/dio.dart';

class ProductOnlineRepo extends ProductREP{
  Dio dio = Dio();
  @override
 Future< List<Product>> getProduct(String source) async{
    final response =await dio.get(source);
    return dataToproduct( response.data["products"] );
  }

  @override
  storgeProduct(String source) {
    // TODO: implement storgeProduct
    throw UnimplementedError();
  }

  List<Product> dataToproduct(data){
    return (data as List).map((e) => Product.fromJson(e)).toList();
  }

}