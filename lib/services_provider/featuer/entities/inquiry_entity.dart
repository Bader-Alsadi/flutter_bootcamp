import 'package:floor/floor.dart';

@entity
class Inquiry{
  @primaryKey
  int? id;
  String Inquiry_name;
  String? replay;
  int user_id;
  int Service_provider_id;
  String? create_at;

  Inquiry({this.id,this.replay,required this.Inquiry_name,required this.Service_provider_id,required this.user_id}){
    create_at= DateTime.now().toString();
  }
  

}