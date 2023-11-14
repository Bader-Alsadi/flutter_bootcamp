import 'package:app/T_moghter_database/core/constanst/api_url.dart';
import 'package:app/T_moghter_database/core/helper/repositeries/product_repo.dart';
import 'package:dio/dio.dart';

class OnlineREpo extends ProductREPO{
  Dio dio = Dio();
  @override
 SttoreProduct({required String source,required dynamic data}) {
    // TODO: implement SttoreProduct
    throw UnimplementedError();
  }

  @override
  Future<List<dynamic>>  getProduct() async{
  final receveDate=await  dio.get(API_URL.PRODUCT);
  return receveDate.data["products"];

  }

}