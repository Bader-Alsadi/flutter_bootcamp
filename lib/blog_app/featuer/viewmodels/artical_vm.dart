import 'dart:io';

import 'package:app/blog_app/core/constant/url_Api.dart';
import 'package:app/blog_app/core/helper/apihelpr.dart';
import 'package:app/blog_app/featuer/models/article.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ArticalVM with ChangeNotifier {
  List<Article> _allArtical = [];

  int getleinth() {
    return _allArtical.length;
  }

  Future<List<Article>> featchArticals() async {
    final response = await ApIHelper.dioConnect().get(APIURl.AERITCAL);
    Map<String, dynamic> result = await response.data["result"];

    if (result["code"] == 1200) {
      List data = result["data"];
      _allArtical = data.map<Article>((e) => Article.fromJson(e)).toList();
    }

    return _allArtical;
  }

  Future<int> addArtical(FormData data, String tokken) async {
    final article = data.fields;
    try {
      final response = await ApIHelper.dioConnect().post(APIURl.ADD_AERITCAL,
          data: data,
          options: Options(headers: {"Authorization": "Bearer $tokken"}));
      Map<String, dynamic> result = await response.data["result"];
      addTolist(article[0].value, article[1].value,
          data.files.first.value.filename ?? "defult.png");
      print("code : ${result["code"]}");
      return result["code"];
    } on DioException catch (e) {
      print("code : ${e.response!.statusCode}");

      return e.response!.statusCode ?? 404;
    }
  }

  Future<File> getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    File file = File(image!.path);
    return file;
  }

  addTolist(title, content, image) {
    int id = _allArtical.isNotEmpty ? _allArtical.last.id! + 1 : 1;
    _allArtical
        .add(Article(id: id, title: title, content: content, image: image));
    notifyListeners();
  }
}
