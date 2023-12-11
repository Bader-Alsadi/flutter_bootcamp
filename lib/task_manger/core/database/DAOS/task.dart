import 'package:app/task_manger/core/database/entity/task.dart';
import 'package:floor/floor.dart';

@dao
abstract class TaskDao {
  @Query("select * from Task")
  Future<List<Task>> getAllTask();
   @Query("select * from Task where id=:id")
  Future<List<Task>> getAllTaskbyTaskId(int id);
  @insert
  Future<int> insertTask(Task Task);
  @update
  Future<int> updateTask(Task Task);
  @delete
  Future<int> deleteTask(Task Task);
}
