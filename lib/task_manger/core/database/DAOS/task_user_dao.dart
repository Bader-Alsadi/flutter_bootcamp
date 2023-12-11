import 'package:app/task_manger/core/database/entity/user.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDao {
  @Query("select * from user")
  Future<List<User>> getAllUser();
  @Query("select * from user where id=:id")
  Future<User?> getAllUserbyUserid(int id);
  @Query(
      "select * from user where id in (select user_id from TaskUser where task_id=:id)")
  Future<List<User>> getAllUserbytaskId(int id);
  @insert
  Future<int> insertUser(User user);
  @update
  Future<int> updateUser(User user);
  @delete
  Future<int> deleteUser(User user);
}
