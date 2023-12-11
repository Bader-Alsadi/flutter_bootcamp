import 'package:app/task_manger/core/database/entity/task.dart';
import 'package:app/task_manger/core/database/entity/task_user.dart';
import 'package:app/task_manger/core/database/entity/user.dart';
import 'package:app/task_manger/core/helper/db_helper.dart';
import 'package:flutter/foundation.dart';

class TaskVM extends ChangeNotifier {
  List<int> usersId = [];
  List<Task> task = [];

  Future<int> addTask(Task task, List<int> users) async {
    int id = await DBhelper.databse.taskDao.insertTask(task);
    if (id > 0) {
      users.forEach((element) async {
        usersId.add(await DBhelper.databse.taskUser
            .insertTaskUser(TaskUser(task_id: id, user_id: element)));
      });
    }
    notifyListeners();
    usersId = [];
    return id;
  }

  Future<List<Task>> getdate() async {
    task = await DBhelper.databse.taskDao.getAllTask();
    return task;
  }
}
