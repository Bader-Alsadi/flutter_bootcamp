import 'package:floor/floor.dart';
@entity
class Category{
  @primaryKey
  int? id;
  String category_name;
  String? category_image;
  String? create_at;


  Category({this.id,required this.category_name, this.category_image}){

  }


}