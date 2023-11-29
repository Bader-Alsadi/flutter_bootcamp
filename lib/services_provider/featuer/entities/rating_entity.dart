import 'package:floor/floor.dart';

@entity
class Rating{
  @primaryKey
  int? id;
  int rate;
  int user_id;
  int order_id;
  String? create_at;

  Rating({this.id,required this.rate,required this.order_id,required this.user_id}){
    create_at=DateTime.now().toString();
  }
}