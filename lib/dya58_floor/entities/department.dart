import 'package:floor/floor.dart';

@entity
class Department {
  @primaryKey
  final int? id;
  @ColumnInfo(name: "Deparment_name")
  final String? name;

  Department({this.id, this.name});
}
