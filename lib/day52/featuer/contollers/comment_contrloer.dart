import 'package:app/day45/core/helper/dio_conniction.dart';
import 'package:app/day52/core/consents/api_url.dart';
import 'package:app/day52/featuer/models/comment_modles.dart';

class CommentContoller{
   Future<List<Comment>> fetuchData({required String id}) async {
    final response =
        await ConnectDio.dioConnect().get('${APIurl.blogUrl}/$id/comments');
    List content = response.data;
    List<Comment> allComment =
        content.map((e) => Comment.fromJson(e)).toList();
        

    return allComment;
  }
}