import 'package:app/day45/core/helper/dio_conniction.dart';
import 'package:app/day46/featuer/model/task.dart';

class TaskContoller {
  Future<List<Task>> fetuchData() async {
    final response =
        await ConnectDio.dioConnect().get('https://dummyjson.com/todos');
    List content = response.data["todos"];
    List<Task> alltask = content.map((e) => Task.fromJson(e)).toList();

    return alltask;
  }

  Future<int?> saveData({required Task t}) async {
    final response = await ConnectDio.dioConnect()
        .post('https://dummyjson.com/todos/add', data: t.toJson());
    print(response.statusCode);

    return response.statusCode;
  }

  Future<int?> editData({required Task t}) async {
    print(t.id);
    final response = await ConnectDio.dioConnect()
        .put('https://dummyjson.com/todos/${t.id}', data: t.toJson());
    print(response.statusCode);
    return response.statusCode;
  }

  Future<int?> deletData({required Task t}) async {
    final response = await ConnectDio.dioConnect().delete(
      'https://dummyjson.com/todos/${t.id}',
    );

    return response.statusCode;
  }
}
