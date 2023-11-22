import 'package:floor/floor.dart';

@dao
abstract class Aggragtion {
  @Query("select count(*) from Course")
  Future<int?> countCourse();
  @Query("select count(*) from Department")
  Future<int?> countDepartment();
  @Query("select count(*) from RegCourse")
  Future<int?> countRegCourse();
  @Query("select count(*) from StidentX")
  Future<int?> countStident();
}
