
import 'package:floor/floor.dart';

@entity 
class Task {
@primaryKey
int? id ;
String? title;
String? description;
bool? isEnd ;
String? beging;
String? end;
Task({this.id,this.title,this.description, this.beging,this.end,this.isEnd=false});
}