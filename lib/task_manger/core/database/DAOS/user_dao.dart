import 'package:app/task_manger/core/database/entity/task_user.dart';
import 'package:floor/floor.dart';

@dao
abstract class TaskUserDao {
  @Query("select * from TaskUser where task_id =:id")
 Future< List<TaskUser>> getAllTaskUser(int id);
  @insert
 Future<int> insertTaskUser(TaskUser taskUser);
  @update
 Future< int> updateTaskUser(TaskUser taskUser);
  @delete
 Future<int> deleteTaskUser(TaskUser taskUser);
}
