import 'package:app/task_manger/core/database/entity/task.dart';
import 'package:app/task_manger/core/database/entity/user.dart';
import 'package:floor/floor.dart';

@Entity(foreignKeys: [
  ForeignKey(childColumns: ["user_id"], parentColumns: ["id"], entity: User,onDelete: ForeignKeyAction.cascade,onUpdate: ForeignKeyAction.cascade),
  ForeignKey(childColumns: ["task_id"], parentColumns: ["id"], entity: Task,onDelete: ForeignKeyAction.cascade,onUpdate: ForeignKeyAction.cascade),
])
class TaskUser {
  @primaryKey
  int? id;
  int? user_id;
  int? task_id;

  TaskUser({this.id,this.task_id, this.user_id});
}
