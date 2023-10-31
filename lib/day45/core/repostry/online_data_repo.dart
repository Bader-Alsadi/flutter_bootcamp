// import 'package:app/day45/core/helper/dio_conniction.dart';
// import 'package:app/day45/core/repostry/data_repostry.dart';

// class DataOnlineRepo extends DataRepo{
//   @override
//    Future <Map<String,dynamic>>  getdata({required String sourec, List<String>? colume})async {
//     final  serverData = await   ConnectDio.dioConnect().get(sourec);
//     Map<String,dynamic>  data = serverData.data ;
//     return data;
//   }
// Future<Map<String,dynamic>> saveData ({required Map<String,dynamic> data,required String source})async{
//   final serverData = await 
//     return {};
//   }
// }