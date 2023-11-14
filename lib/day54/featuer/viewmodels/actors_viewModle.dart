
import 'package:app/day54/core/helper/db_manger.dart';
import 'package:app/day54/featuer/models/actors_modle.dart';

class ActoreVeiwModel{
DBmanager dBmanager =DBmanager();
  Future<List<Actore>> fetchDate() async {
    List<Map<String, dynamic>> fetchDate = await dBmanager.getAllData(
      DBmanager.TBL_ACTOR,
    );
     return fetchDate.map((e) => Actore.fromJson(e)).toList();
  }

  addall({required List<dynamic> row,required List<dynamic> subrow}){
    dBmanager.addAllDate(row: row, subrow: subrow);
  }


  Future<int> saveDate(Actore actore) async {
    return await dBmanager.insertData(DBmanager.TBL_ACTOR, actore.toJson());
  }
  
}