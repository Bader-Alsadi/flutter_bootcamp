import 'dart:math';

import 'package:app/dya58_floor/database/app_databas.dart';
import 'package:floor/floor.dart';

class DBhelper {
  static late AppDatabase databse;

  static initDatabase() async {
    Callback callback = Callback(
      onCreate: (db, v) async {
        List<String> dep = ["cs", "it", "is"];
        String result = List.generate(
            dep.length, (index) => "(${index + 1},'${dep[index]}')").join(",");
        await db.execute("insert into department values $result");
        List<String> cro = [
          "dart programming",
          "c++ programming",
          "c# programming"
        ];
        result = List.generate(
                cro.length,
                (index) =>
                    "(${index + 1},'${cro[index]}',${Random().nextInt(35) + 15},${index + 1})")
            .join(",");
        await db.execute("insert into course values $result");
      },
    );
    databse = await $FloorAppDatabase
        .databaseBuilder("bootcamp_db.db")
        .addCallback(callback)
        .build();
  }
}
