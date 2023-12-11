


import 'package:app/task_manger/core/database/database/database.dart';

class DBhelper {
  static late AppDatabase databse;

  static initDatabase() async {
  
    databse = await $FloorAppDatabase
        .databaseBuilder("task_mager_db.db")
        .build();
  }
}
