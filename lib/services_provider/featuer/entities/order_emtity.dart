import 'package:floor/floor.dart';

@entity
class Order{
  @primaryKey
  int? id;
  int User_id;
  int Service_id;
  String? state;
  String? create_at;

  Order({this.id,required this.User_id,required this.Service_id,}){
    this.create_at=DateTime.now().toString();
    this.state="waiting";
  }


}