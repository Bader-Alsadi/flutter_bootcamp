
import 'package:dio/dio.dart';
import 'package:app/T_moh_code/lib/constants/api_url.dart';
import 'package:app/T_moh_code/lib/core/repositories/products_repo.dart';
class OnlineProductsRepo extends ProductsRepo{
  Dio d=Dio();
  @override
 Future<List<dynamic>> getProducts() async{
      Response serverResponse=await d.get(API_URL.PRODUCTS);
      return serverResponse.data["products"];



  }

  @override
  storeProduct(String source, data) {

  }





}