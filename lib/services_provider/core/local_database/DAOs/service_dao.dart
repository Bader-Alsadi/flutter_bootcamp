import 'package:app/services_provider/core/local_database/entities/service_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class ServiceDao {
  @Query("select * from Service ")
  Future<List<Service>> getAllService();
  @Query("select * from Service where Service_provider_id = :id")
  Future<Service?> getServicebyid(int id);
  @Query("select * from Service where Service_name =:keyword")
  Future<List<Service>> getServiceByname(String keyword);
  @insert
  Future<int> insertService(Service service);
  @update
  Future<int> updateService(Service service);
  @delete
  Future<int> deleteService(Service service);
  @Query("delete from Service where id = :id")
  Future<int?> deleteServiceByid(int id);
}
