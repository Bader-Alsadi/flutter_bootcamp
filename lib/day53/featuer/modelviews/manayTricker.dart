import 'package:app/day53/core/helper/db_manager.dart';
import 'package:app/day53/featuer/models/manayTricker.dart';

class ManayTrikerModleView {
  DBmanager dBmanager = DBmanager();
  Future<List<ManayTriker>> fetchDate() async {
    List<Map<String, dynamic>> fetchDate = await dBmanager.getAllData(
      DBmanager.TBL_NAME,
    );
    // print("bader$fetchDate");
    return fetchDate.map((e) => ManayTriker.fromJOSN(e)).toList();
  }

  Future<int> saveDate(ManayTriker manayTriker) async {
    return await dBmanager.insertData(DBmanager.TBL_NAME, manayTriker.tojosn());
  }

  Future<int> deleteData(int id) async {
    return dBmanager.deleteData(DBmanager.TBL_NAME, "$id");
  }

  Future<int> updateData(ManayTriker manayTriker) async {
    return dBmanager.updateData(DBmanager.TBL_NAME, manayTriker.tojosn());
  }

  Map<String, double> claIncomeAndExpended(List<ManayTriker> data) {
    Map<String, double> result = {"income": 0.0, "expende": 0.0};
    data.forEach((element) {
      if (element.opretore)
        result["income"] = result["income"]! + element.amount;
      else
        result["expende"] = result["expende"]! + element.amount;
    });
    return result;
  }
}
