import 'package:floor/floor.dart';
@entity
class Category{
  @primaryKey
  int? id;
  String category_name;
  String? create_at;


  Category({this.id,required this.category_name}){
    create_at = DateTime.now().toString();

  }


}