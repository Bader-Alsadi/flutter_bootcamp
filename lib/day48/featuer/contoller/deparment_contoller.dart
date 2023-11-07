import 'package:app/day45/core/helper/dio_conniction.dart';
import 'package:app/day48/core/constant/api_url.dart';
import 'package:app/day48/featuer/models/department_model.dart';

class DeparmentContoller {
  Future<List<Department>> fetuchData() async {
    final response =
        await ConnectDio.dioConnect().get('${APIurl.departmentIrl}departments');
    List content = response.data;
    List<Department> allDepartment =
        content.map((e) => Department.fromJosn(e)).toList();
        

    return allDepartment;
  }

  Future<int> saveData({required Map<String, dynamic> josn}) async {
    final response = await ConnectDio.dioConnect()
        .post('${APIurl.departmentIrl}departments', data: josn);
    print(josn);
   
    // Department department = Department.fromJosn(response.data);
    return response.statusCode!;
  }

  Future<int> editData({required Department department}) async {
    final response = await ConnectDio.dioConnect().put(
        '${APIurl.departmentIrl}departments/${department.id}',
        data: department.toJosn());
   

    // print(allDepartment);
    // Department department = Department.fromJosn(response.data);
    return response.statusCode!;
  }

  Future<int> DeleteData({required String id}) async {
    print("hj$id");
    final response =
        await ConnectDio.dioConnect().delete('${APIurl.DELETE_URL}/${id}');

    // print(allDepartment);
    // Department department = Department.fromJosn(response.data);
    return response.statusCode!;
  }
}
