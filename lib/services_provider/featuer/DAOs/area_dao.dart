import 'package:app/services_provider/featuer/entities/area_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class AreaDao {
  @Query("select * from Area ")
  Future<List<Area>> getAllArea();
  @Query("select * from Area where id = :id")
  Future<Area?> getAreabyid(int id);
  @Query("select * from Area where area_name =:keyword")
  Future<List<Area>> getAreaByname(String keyword);
  @insert
  Future<int> insertArea(Area area);
  @update
  Future<int> updateArea(Area area);
  @delete
  Future<int> deleteArea(Area area);
  @Query("delete from Area where id = :id")
  Future<int?> deleteAreaByid(int id);
}
