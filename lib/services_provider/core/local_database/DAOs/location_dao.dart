import 'package:app/services_provider/core/local_database/entities/location_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class LocationDao {
  @Query("select * from Location ")
  Future<List<Location>> getAllLocation();
  @Query("select * from Location where user_id = :id")
  Future<Location?> getLocationbyid(int id);
  @Query("select * from Location where Location_name =:keyword")
  Future<List<Location>> getLocationByname(String keyword);
  @insert
  Future<int> insertLocation(Location location);
  @update
  Future<int> updateLocation(Location location);
  @delete
  Future<int> deleteLocation(Location location);
  @Query("delete from Location where id = :id")
  Future<int?> deleteLocationByid(int id);
}
