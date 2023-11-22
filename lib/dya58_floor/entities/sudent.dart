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
   int? id;
  @ColumnInfo(name: "full_name")
   String? name;
  @ColumnInfo(name: "phone_no")
   String? phoneNo;
   String? email;
   bool? active;

   int? depratmentId;

  @ignore
   bool isSelected;
  @ignore
   String? department_name;

  Student(
      {this.id,
      this.name,
      this.phoneNo,
      this.active,
      this.email,
      this.depratmentId,
      this.isSelected = false,
      this.department_name});
}
