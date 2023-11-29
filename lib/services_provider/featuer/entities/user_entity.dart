
import 'package:floor/floor.dart';

@Entity()
class User {
  @primaryKey
  int? id;
  String user_name;
  String cell_phone;
  String? user_image;
  int area_id;
  String? create_at;

  User({this.id,required this.user_name,required this.cell_phone,this.user_image,required this.area_id }){
    this.create_at= DateTime.now().toString();
  }



}