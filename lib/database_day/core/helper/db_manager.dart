import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";

class DBmanager {
  Database? _db;

  static const String DB_NAME = "notes1.db";
  static const String TBL_NAME = "notes";
  static const String COL_TITLE = "title";
  static const String COL_DESCRPTION = "descrption";
  static const String COL_DATE = "date";
  static const String COL_STATUS = "status";
  static const String COL_ID = "id";

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
  $COL_TITLE varchar(255) not null,
  $COL_DESCRPTION text not null ,
  $COL_DATE varchar(255) not null ,
  $COL_STATUS INTEGER default 0
)
""");
 db.execute("""
create table if not exsit users (
  $COL_ID INTEGER PRIMARY KEY autoincrement ,
  name varchar(255) not null,
  emale text not null ,
  password varchar(255) not null 
)
""");
      },
      onUpgrade: (db, oldVersion, newVersion) {
        db.execute("""
create table if not exsit users (
  $COL_ID INTEGER PRIMARY KEY autoincrement ,
  name varchar(255) not null,
  emale text not null ,
  password varchar(255) not null 
)
""");
      },
    );
  }

  Future<List<Map<String, dynamic>>> getAllData(String tal_name) async {
    Database localDb = await getObject;
    return await localDb.query(tal_name);
  }

  Future<List<Map<String, dynamic>>> getAllDataWithWhere(String tal_name,
      {List<String>? cols, List<dynamic>? args}) async {
    Database localDb = await getObject;

    return await localDb.query(tal_name,
        where: " $COL_ID=? and $COL_STATUS=?", whereArgs: args, columns: cols);
  }

  Future<List<Map<String, dynamic>>> getAllDataWithSQl(String sql) async {
    sql = "select from $TBL_NAME $COL_TITLE , $COL_DESCRPTION where $COL_ID=1";
    Database localDb = await getObject;

    return await localDb.rawQuery(sql);
  }

  Future<int> insertData(String tal_name, Map<String, dynamic> data) async {
    Database localDb = await getObject;
    return await localDb.insert(tal_name, data);
  }

  Future<int> updateData(String tbl_name, Map<String, dynamic> data) async {
    Database localDb = await getObject;
    return await localDb.update(tbl_name, data, where: " id =  ${data["id"]}");
  }

  Future<int> deleteData(String tbl_name, String id) async {
    Database localDb = await getObject;
    return localDb.delete(tbl_name, where: "id=$id");
  }
}
