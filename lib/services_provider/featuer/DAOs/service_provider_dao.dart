import 'package:app/services_provider/featuer/entities/service_provider_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class ServiceProviderDao {
  @Query("select * from ServiceProvider ")
  Future<List<ServiceProvider>> getAllServiceProvider();
  @Query("select * from ServiceProvider where id = :id")
  Future<ServiceProvider?> getServiceProviderbyid(int id);
  @Query("select * from ServiceProvider where ServiceProvider_name =:keyword")
  Future<List<ServiceProvider>> getServiceProviderByname(String keyword);
  @insert
  Future<int> insertServiceProvider(ServiceProvider serviceProvider);
  @update
  Future<int> updateServiceProvider(ServiceProvider serviceProvider);
  @delete
  Future<int> deleteServiceProvider(ServiceProvider serviceProvider);
  @Query("delete from ServiceProvider where id = :id")
  Future<int?> deleteServiceProviderByid(int id);
}
