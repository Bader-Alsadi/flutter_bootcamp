import 'package:app/blog_app/core/constant/url_Api.dart';
import 'package:app/blog_app/core/helper/apihelpr.dart';
import 'package:dio/dio.dart';

class CommentVM {
  Future<int> addCommnet(data, tokken) async {
    try {
      final response = await ApIHelper.dioConnect().post(APIURl.ADD_COMMENT,
          data: data,
          options: Options(headers: {"Authorization": "Bearer $tokken"}));
      Map<String, dynamic> result = await response.data["result"];
      return result["code"];
    } on DioException catch (e) {
      return e.response!.statusCode ?? 404;
    }
  }
}
