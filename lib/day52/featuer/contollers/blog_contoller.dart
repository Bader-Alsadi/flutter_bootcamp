import 'package:app/day45/core/helper/dio_conniction.dart';
import 'package:app/day52/core/consents/api_url.dart';
import 'package:app/day52/featuer/models/blod_modles.dart';

class BolgContoller{
   Future<List<Blog>> fetuchData() async {
    final response =
        await ConnectDio.dioConnect().get('${APIurl.blogUrl}');
    List content = response.data;
    List<Blog> allBlog =
        content.map((e) => Blog.fromJson(e)).toList();
        

    return allBlog;
  }

  Future<int> saveData({required Blog blog}) async {
    final response = await ConnectDio.dioConnect()
        .post('${APIurl.blogUrl}', data: blog.toJson());
    // print(josn);
   
    // Department department = Department.fromJosn(response.data);
    return response.statusCode!;
  }

  Future<int> editData({required Blog blog}) async {
    final response = await ConnectDio.dioConnect().put(
        '${APIurl.blogUrl}/${blog.id}',
        data: blog.toJson());
   

  //   // print(allDepartment);
  //   // Department department = Department.fromJosn(response.data);
    return response.statusCode!;
  }

  Future<int> DeleteData({required String id}) async {
    print("hj$id");
    final response =
        await ConnectDio.dioConnect().delete('${APIurl.blogUrl}/${id}');

    // print(allDepartment);
    // Department department = Department.fromJosn(response.data);
    return response.statusCode!;
  }
}