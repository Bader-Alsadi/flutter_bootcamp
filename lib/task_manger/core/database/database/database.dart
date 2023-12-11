import 'dart:async';

import 'package:app/task_manger/core/database/DAOS/task.dart';
import 'package:app/task_manger/core/database/DAOS/task_user_dao.dart';
import 'package:app/task_manger/core/database/DAOS/user_dao.dart';
import 'package:app/task_manger/core/database/entity/task.dart';
import 'package:app/task_manger/core/database/entity/task_user.dart';
import 'package:app/task_manger/core/database/entity/user.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [User, Task, TaskUser])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
  TaskUserDao get taskUser;
  TaskDao get taskDao;
}
