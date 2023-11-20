import 'package:app/dya58_floor/entities/sudent.dart';
import 'package:floor/floor.dart';

@dao
abstract class StudentDao {
  @Query("select * from StidentX")
  Future<List<Student>> getAllStudent();
  @Query("select * from StidentX where id= :id")
  Future<Student?> getOneStrudent(int id);
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
