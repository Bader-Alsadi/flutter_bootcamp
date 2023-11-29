import 'package:floor/floor.dart';

@entity
class Location{
@primaryKey
int? id;
String descripction;
int user_id;
String? create_at;

Location({this.id,required this.descripction,required this.user_id}){
  this.create_at=DateTime.now().toString();
}

}