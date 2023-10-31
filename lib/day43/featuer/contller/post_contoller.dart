import 'dart:convert';

import 'package:app/day43/featuer/models/post.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class PostContoller {
  List<Post> allPost = [];

  Future<List<Post>?> getPost() async {
    String content = await rootBundle.loadString("assets/post_file.json");
    // print(content);
    List posts = jsonDecode(content);
    print(posts);
    return allPost = posts.map((e) => Post.fromJson(e)).toList();
  }

  Future<List<Post>> fetuchData()async{
Dio _dio = Dio();
final  response = await _dio.get('https://dummyapi.io/data/v1/post?limit=10&#39', options: Options(
headers: {"app-id": "653f57ce0d18c558626e3884"},));
List content = response.data["data"];
List<Post> allpost = content.map((e) => Post.fromJson(e)).toList();

return allpost;
  }  
}

