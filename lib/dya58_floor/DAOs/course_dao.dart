import 'package:app/dya58_floor/entities/course.dart';
import 'package:floor/floor.dart';

@dao
abstract class CourseDao {
  @Query("select * from Course")
  Future<List<Course>> getAllCourse();
  @Query(
      "select * from Course where id in (select CourseId from RegCourse where StudentId= :StudentId)")
  Future<List<Course>> getAllCoursebyStudentid(int StudentId);
  @Query(
      "select * from Course where depratmentId=:depratmentId and Course.id not in (select CourseId from RegCourse where StudentId= :StudentId) ")
  Future<List<Course>> getAllCoursebyDebID(int depratmentId, int StudentId);
  @Query("select * from Course where id= :id")
  Future<Course?> getOneStrudent(int id);
  @insert
  Future<int> addCourse(Course s);
  @insert
  Future<List<int>> AddCourseList(List<Course> s);
  @update
  Future<int> updateCourse(Course s);
  @update
  Future<int> updateCourseList(List<Course> s);
  @Query("delete from Course where id = :id")
  Future<int?> deleteCourseById(int id);
  @delete
  Future<int> deleteCourse(Course s);
  @delete
  Future<int> deleteCourseList(List<Course> s);
  @Query("delete from Course")
  Future<int?> deleteAllCourse();
  @Query("select * from Course where name like :word")
  Future<List<Course>> searshByname(String word);
}
