import 'package:app/day45/core/helper/dio_conniction.dart';
import 'package:app/day49/core/constans/api_url.dart';
import 'package:app/day49/featuer/models/product_model.dart';

class ProductContoller{

  Future<List<Product>> fetuchData({required String category}) async {
    final response = await ConnectDio.dioConnect().get("${APIurl.PRODUCT_URL}${category}");
    // print(response.data.runtimeType);

    List content = response.data;
    List<Product> allproduct = content.map((e) => Product.fromJson(e)).toList();
    print(allproduct);
    // print(content);
    return allproduct;
  }
}