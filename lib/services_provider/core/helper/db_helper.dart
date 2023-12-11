import 'dart:math';

import 'package:app/services_provider/core/local_database/database/app_database.dart';
import 'package:floor/floor.dart';

class DBhelper {
  static late AppDatabase database;
  static initDatabase() async {
    Callback callback = Callback(
      onCreate: (database, version) async {
        List category = ["داهان", "سائق", "سباق"];
        List area = ["شبوة", "عدن", "المكلا"];
        List users = ["بدر صالح", "يوسف عيظة", "محمد امين"];

        String result = List.generate(category.length,
                (index) => "(${index + 1},'${category[index]}','2020/12/01')")
            .join(",");
        await database.execute("insert into Category values $result");
        result = List.generate(area.length,
                (index) => "(${index + 1},'${area[index]}','2020/12/01')")
            .join(",");
        await database.execute("insert into Area values $result");
        result = List.generate(
                users.length,
                (index) =>
                    "(null,'${users[index]}','77454145${index + 1}',null,null,${Random().nextInt(2) + 1},'2020/12/01')")
            .join(",");
        await database.execute("insert into User values $result");

        result = List.generate(
                category.length,
                (index) =>
                    "(${index + 1},${index + 1},null,'2020/12/01',${index + 1})")
            .join(",");
        await database.execute("insert into ServiceProvider values $result");
      },
    );
    database = await $FloorAppDatabase
        .databaseBuilder("serviec_provider.db")
        .addCallback(callback)
        .build();
  }
}
