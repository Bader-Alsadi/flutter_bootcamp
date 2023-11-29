
import 'package:floor/floor.dart';

@entity
class Area{
  @primaryKey
  int? id;
  String area_name;
  String? create_at;


  Area({this.id,required this.area_name}){
    this.create_at= DateTime.now().toString();
  }

}