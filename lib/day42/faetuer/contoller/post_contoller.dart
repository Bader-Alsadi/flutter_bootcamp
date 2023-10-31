import 'dart:convert';

import 'package:app/day42/faetuer/models/post_modle.dart';
import 'package:flutter/services.dart';

class PostContoller {
  List<Post> allPost = [];

  Future<List<Post>?> getPost() async {
    String content = await rootBundle.loadString("assets/post_file.json");
    // print(content);
    List posts = jsonDecode(content);
    print(posts);
    return allPost = posts.map((e) => Post.fromJosn(e)).toList();
  }
}
