abstract class DataRepo {
  Future <Map<String,dynamic>> getdata({required String sourec,List<String>? colume});
  Future<Map<String,dynamic>> saveData ({required Map<String,dynamic> data,required String source});
}