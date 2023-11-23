import 'package:floor/floor.dart';

@entity
class Department {
  @primaryKey
   int? id;
  @ColumnInfo(name: "Deparment_name")
   String? name;

  Department({this.id, this.name});
}
