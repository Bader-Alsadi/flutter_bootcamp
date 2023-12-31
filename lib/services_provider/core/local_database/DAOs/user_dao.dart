import 'package:app/services_provider/core/local_database/entities/user_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDao {
  @Query("select * from User ")
  Future<List<User>> getAllUser();
  @Query("select * from User U join Location L on U.id=L.user_id  where U.id = :id")
  Future<User?> getUserbyid(int id);
  @Query("select * from User where cell_phone =:keyword")
  Future<List<User>> getUserByname(String keyword);
  @insert
  Future<int> insertUser(User user);
  @update
  Future<int> updateUser(User user);
  @delete
  Future<int> deleteUser(User user);
  @Query("delete from User where id = :id")
  Future<int?> deleteUserByid(int id);
}
