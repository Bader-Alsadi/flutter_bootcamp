
import 'package:floor/floor.dart';

@entity
class Service{
  @primaryKey
  int? id;
  String Service_name;
  String description;
  int category_id;
  int Service_provider_id;
  String? create_at;

  Service({this.id,required this.Service_name,required this.description,required this.category_id,required this.Service_provider_id}){
    create_at = DateTime.now().toString();
  }

}