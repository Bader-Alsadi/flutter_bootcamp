import 'package:app/blog_app/core/constant/url_Api.dart';
import 'package:app/blog_app/core/helper/apihelpr.dart';
import 'package:app/blog_app/core/helper/getStroge/getStroge_he;per.dart';
import 'package:app/blog_app/featuer/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class UserVM with ChangeNotifier {
  List<User> _alluser = [];

  Login(User user) async {
    print(user.email);
    Response response;
    try {
      response =
          await ApIHelper.dioConnect().post(APIURl.LOGIN, data: user.toJson());
      if (response.statusCode == 200) {
        Map<String, dynamic> result = await response.data["result"];
        if (result["code"] == 1200) {
          GetStorage box = GetStorageHelper.get_box("user");
          box.write("id", result["data"]["id"]);
          box.write("name", result["data"]["name"]);
          box.write("token", result["data"]["token"]);
        }

        return result["code"];
      }
    } on DioException catch (e) {
      print(e.response!.statusCode);
      return e.response!.statusCode;
    }
  }

  register(User user) async {
    Response response;
    try {
      response =
          await ApIHelper.dioConnect().post(APIURl.SINGIN, data: user.toJson());
      if (response.statusCode == 200) {
        Map<String, dynamic> result = await response.data["result"];
        if (result["code"] == 1200) {
          GetStorage box = GetStorageHelper.get_box("user");
          box.write("id", result["data"]["id"]);
          box.write("name", result["data"]["name"]);
          box.write("token", result["data"]["token"]);
        }

        return result["code"];
      }
    } on DioException catch (e) {
      print(e.response!.statusCode);
      return e.response!.statusCode ?? 404;
    }
  }
}
