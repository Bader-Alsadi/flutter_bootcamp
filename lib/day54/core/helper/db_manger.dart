import 'dart:math';

import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";

class DBmanager {
  Database? _db;

  static const String DB_NAME = "actors1.db";
  static const String TBL_ACTOR = "actors";
  static const String TBL_AWARD = "awards";

  static const String COL_ID = "id";
  static const String COL_NAME = "name";

  static const String COL_ACTRO_ID = "actor_id";

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
create table $TBL_ACTOR (
  $COL_ID INTEGER PRIMARY KEY autoincrement ,
  $COL_NAME varchar(255) not null
)
""");
        await db.execute("""
create table $TBL_AWARD (
  $COL_ID INTEGER PRIMARY KEY autoincrement ,
  $COL_NAME varchar(255) not null,
  $COL_ACTRO_ID INTEGER,
  foreign key ($COL_ACTRO_ID) references $TBL_ACTOR($COL_ID)
)
""");
      },
    );
  }

  addAllDate(
      {required List<dynamic> row, required List<dynamic> subrow}) async {
    Database localDb = await getObject;
    List<int> ids = [];
    Batch b = localDb.batch();
    for (int i = 0; i < row.length; i++) {
      b.insert(TBL_ACTOR, {COL_NAME: row[i]["name"]});
    }
    ids = (await b.commit() as List).map<int>((e) => e).toList();
    for (int i = 0; i < ids.length; i++)
      b.insert(TBL_AWARD, {
        COL_NAME: subrow[Random().nextInt(subrow.length)]["name"],
        COL_ACTRO_ID: ids[i]
      });
    b.commit();
  }

  deleteDatabase() async {
    Database localDb = await getObject;
    await localDb.delete(TBL_ACTOR);
    await localDb.delete(TBL_AWARD);
  }

  Future<List<Map<String, dynamic>>> getAllDatt(String tal_name, int id) async {
    Database localDb = await getObject;
    return await localDb
        .query(tal_name, where: "${DBmanager.COL_ACTRO_ID}=?", whereArgs: [id]);
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
