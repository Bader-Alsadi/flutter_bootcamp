import 'package:app/dya58_floor/entities/reg_course.dart';
import 'package:floor/floor.dart';

@dao
abstract class RegCourseDao {
  @Query("select * from RegCourse")
  Future<List<RegCourse>> getAllRegCourse();
  @Query("select * from RegCourse where id= :id")
  Future<RegCourse?> getOneStrudent(int id);
  @insert
  Future<int> addRegCourse(RegCourse s);
  @insert
  Future<List<int>> AddRegCourseList(List<RegCourse> s);
  @update
  Future<int> updateRegCourse(RegCourse s);
  @update
  Future<int> updateRegCourseList(List<RegCourse> s);
  @Query("delete from RegCourse where id = :id")
  Future<int?> deleteRegCourseById(int id);
  @delete
  Future<int> deleteRegCourse(RegCourse s);
  @delete
  Future<int> deleteRegCourseList(List<RegCourse> s);
  @Query("delete from RegCourse")
  Future<int?> deleteAllRegCourse();
  @Query("select * from RegCourse where name like :word")
  Future<List<RegCourse>> searshByname(String word);
}
