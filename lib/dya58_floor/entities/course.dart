import 'package:floor/floor.dart';

@entity
class Course {
  @primaryKey
   int? id;
   String? name;
   int? hours;
   int? depratmentId;
  @ignore
  bool? isSelected;

  Course({this.id, this.name, this.hours,this.depratmentId});
}
