import 'package:app/dya58_floor/entities/department.dart';
import 'package:floor/floor.dart';

@dao
abstract class DepartmentDao {
  @Query("select * from Department")
  Future<List<Department>> getAllDepartment();
  @Query("select * from Department where id= :id")
  Future<Department?> getOneStrudent(int id);
  @insert
  Future<int> addDepartment(Department s);
  @insert
  Future<List<int>> AddDepartmentList(List<Department> s);
  @update
  Future<int> updateDepartment(Department s);
  @update
  Future<int> updateDepartmentList(List<Department> s);
  @Query("delete from Department where id = :id")
  Future<int?> deleteDepartmentById(int id);
  @delete
  Future<int> deleteDepartment(Department s);
  @delete
  Future<int> deleteDepartmentList(List<Department> s);
  @Query("delete from Department")
  Future<int?> deleteAllDepartment();
  @Query("select * from Department where name like :word")
  Future<List<Department>> searshByname(String word);
}
