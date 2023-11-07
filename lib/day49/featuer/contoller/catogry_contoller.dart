import 'package:app/day45/core/helper/dio_conniction.dart';
import 'package:app/day49/core/constans/api_url.dart';

class CatogaryContoller {
  Future<List<String>> fetuchData() async {
    final response = await ConnectDio.dioConnect().get(APIurl.CATOGRAY_URL);
    print(response.data);

    // List<String> content = response.data;
    // print(content);
    return (response.data as List).map<String>((e) => e).toList();
  }
}
