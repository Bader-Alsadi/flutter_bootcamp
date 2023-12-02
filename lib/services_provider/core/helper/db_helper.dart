import 'package:app/services_provider/core/local_database/database/app_database.dart';
import 'package:floor/floor.dart';

class DBhelper {
  static late AppDatabase database;
  static initDatabase() async {
    Callback callback = Callback(
      onCreate: (database, version) async {
        List category = ["painter", "carpenter", "plumber"];
        String result = List.generate(category.length,
            (index) => "(${index + 1},'${category[index]}','defualt.pug','2020/12/01')").join(",");
        await database.execute("insert into Category values $result");
      },
    );
    database = await $FloorAppDatabase
        .databaseBuilder("serviec_provider.db")
        .addCallback(callback)
        .build();
  }
}
