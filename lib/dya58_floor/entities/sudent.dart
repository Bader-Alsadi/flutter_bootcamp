import 'package:app/dya58_floor/entities/department.dart';
import 'package:floor/floor.dart';

@Entity(tableName: "StidentX", foreignKeys: [
  ForeignKey(
    childColumns: ["depratmentId"],
    parentColumns: ["id"],
    entity: Department,
  )
], indices: [
  Index(value: ["phone_no", "email"], unique: true),
])

class Student {
  @primaryKey
  final int? id;
  @ColumnInfo(name: "full_name")
  final String? name;
  @ColumnInfo(name: "phone_no")
  final String? phoneNo;
  final String? email;
  final bool? active;

  final int? depratmentId;

  @ignore
  final bool isSelected;

  Student(
      {this.id,
      this.name,
      this.phoneNo,
      this.active,
      this.email,
      this.depratmentId,
      this.isSelected = false});
}
