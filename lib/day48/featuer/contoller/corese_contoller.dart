import 'package:app/day45/core/helper/dio_conniction.dart';
import 'package:app/day48/featuer/models/course_model.dart';

class CourseContller {
  Future<List<Course>> fetuchData({required String id}) async {
    final response = await ConnectDio.dioConnect().get(
        'https://654679c2fe036a2fa955bee7.mockapi.io/api/v1/departments/$id/courses');
    List content = response.data;
    List<Course> allCoures = content.map((e) => Course.fromJson(e)).toList();

    return allCoures;
  }

  // Future<int> saveData({required Map<String, dynamic> josn}) async {
  //   final response = await ConnectDio.dioConnect()
  //       .post('${APIurl.departmentIrl}departments', data: josn);
  //   print(josn);

  //   // Department department = Department.fromJosn(response.data);
  //   return response.statusCode!;
  // }

  // Future<int> editData({required Department department}) async {
  //   final response = await ConnectDio.dioConnect().put(
  //       '${APIurl.departmentIrl}departments/${department.id}',
  //       data: department.toJosn());

  //   // print(allDepartment);
  //   // Department department = Department.fromJosn(response.data);
  //   return response.statusCode!;
  // }

  Future<int> DeleteData({required S,required String id}) async {
    print("hj$id");
    final response =
        await ConnectDio.dioConnect().delete('https://654679c2fe036a2fa955bee7.mockapi.io/api/v1/departments/$id/courses/');

    // print(allDepartment);
    // Department department = Department.fromJosn(response.data);
    return response.statusCode!;
  }
}
