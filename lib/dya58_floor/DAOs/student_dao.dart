import 'package:app/dya58_floor/entities/sudent.dart';
import 'package:floor/floor.dart';

@dao
abstract class StudentDao {
   @Query("select * from StidentX ")
  Future<List<Student>> getAllStudent();
  @Query("select * from StidentX join Department on StidentX.depratmentId=Department.id")
  Future<List<Student>> getAllStudentbyDebId();
  @Query("select * from StidentX join Department on StidentX.depratmentId=Department.id where StidentX.id= :id")
  Future<Student?> getOneStrudent(int id);
  @Query("select * from StidentX where id in (select StudentId from RegCourse where CourseId= :CourseId)")
  Future<List<Student>> getAllCoursebyStudentid(int CourseId);
  @insert
  Future<int> addStudent(Student s);
  @insert
  Future<List<int>> AddStudentList(List<Student> s);
  @update
  Future<int> updateStudent(Student s);
  @update
  Future<int> updateStudentList(List<Student> s);
  @Query("delete from StidentX where id = :id")
  Future<int?> deleteStudentById(int id);
  @delete
  Future<int?> deleteStudent(Student s);
  @delete
  Future<int> deleteStudentList(List<Student> s);
  @Query("delete from StidentX")
  Future<int?> deleteAllStudent();
  @Query("select * from StidentX where full_name like :word")
  Future<List<Student>> searshByname(String word);
}
