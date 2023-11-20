import 'package:floor/floor.dart';

@entity
class Course {
  @primaryKey
  final int? id;
  final String? name;
  final int? hours;
  @ignore
  bool? isSelected;

  Course({this.id, this.name, this.hours});
}
