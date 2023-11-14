import 'package:app/database_day/core/helper/db_manager.dart';
import 'package:app/database_day/featuers/models/note_model.dart';

class NoteViewModel {
  DBmanager dBmanager = DBmanager();
  Future<List<Note>> fetchDate() async {
    List<Map<String, dynamic>> fetchDate = await dBmanager.getAllData(
      DBmanager.TBL_NAME,
    );
    return fetchDate.map((e) => Note.fromJOSN(e)).toList();
  }

  Future<int> saveDate(Note note) async {
    
    

    return await dBmanager.insertData(DBmanager.TBL_NAME, note.toJOSN());
  }

  Future<int> updateData (Note note)async{
    return dBmanager.updateData(DBmanager.TBL_NAME, note.toJOSN());
  }

   Future<int> deleteData (int id)async{
    return dBmanager.deleteData(DBmanager.TBL_NAME, "$id");
  }
  addll () async{
    await dBmanager.addAllDate();
  }
}
