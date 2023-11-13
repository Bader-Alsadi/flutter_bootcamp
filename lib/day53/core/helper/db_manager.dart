import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";

class DBmanager {
  Database? _db;

  static const String DB_NAME = "manay.db";
  static const String TBL_NAME = "manayTricker";
  static const String COL_ID = "id";
  static const String COL_AMOUNT = "amount";
  static const String COL_OPRETOR = "opretore";

  Future<Database> get getObject async {
    if (_db == null) {
      _db = await initDatabas();
    }
    return _db!;
  }

  Future<Database> initDatabas() async {
    String folder = await getDatabasesPath();
    String path = join(folder, DB_NAME);

    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute("""
create table $TBL_NAME (
  $COL_ID INTEGER PRIMARY KEY autoincrement ,
  $COL_AMOUNT varchar(255) not null,
  $COL_OPRETOR INTEGER default 0
)
""");
      },
    );
  }

  Future<List<Map<String, dynamic>>> getAllData(String tal_name) async {
    Database localDb = await getObject;
    return await localDb.query(tal_name);
  }

  Future<int> insertData(String tal_name, Map<String, dynamic> data) async {
    Database localDb = await getObject;
    return await localDb.insert(tal_name, data);
  }

  Future<int> updateData(
    String tbl_name,
    Map<String, dynamic> data,
  ) async {
    var id = data["id"];
    data.remove("id");
    Database localDb = await getObject;
    return await localDb
        .update(tbl_name, data, where: " id =?", whereArgs: [id]);
  }

  Future<int> deleteData(String tbl_name, String id) async {
    Database localDb = await getObject;
    return localDb.delete(tbl_name, where: "id=$id");
  }
}
