import 'package:floor/floor.dart';
@entity
class ServiceProvider{
  @primaryKey
  int? id;
  String career ;
  String? detilas;
  String? create_at;

  ServiceProvider({this.id,required this.career, this.detilas}){
    this.create_at=DateTime.now().toString();
  }

}