import 'package:app/dya58_floor/entities/course.dart';
import 'package:app/dya58_floor/entities/sudent.dart';
import 'package:floor/floor.dart';



@Entity(
  primaryKeys: ['StudentId', 'CourseId'],
  foreignKeys: [
    ForeignKey(childColumns: ['StudentId'], parentColumns: ['id'], entity: Student),
    ForeignKey(childColumns: ['CourseId'], parentColumns: ['id'], entity: Course),
  ]
)

class RegCourse {
  final int? StudentId;
  final int? CourseId;

  RegCourse({this.StudentId, this.CourseId});
}