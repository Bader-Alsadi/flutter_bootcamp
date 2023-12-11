import 'package:app/services_provider/core/local_database/entities/service_provider_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class ServiceProviderDao {
  @Query(
      "select * from ServiceProvider SP join User U on SP.user_id = U.id join  Category C on SP.Category_id = C.id")
  Future<List<ServiceProvider>> getAllServiceProvider();
  @Query(
      "select * from ServiceProvider SP join User U  onSP.user_id = U.id join  Category C on SP.Category_id = C.id  where id = :id")
  Future<ServiceProvider?> getServiceProviderbyid(int id);
  @Query(
      "select * from ServiceProvider SP join User U on SP.user_id = U.id join  Category C on SP.Category_id = C.id  where Category_id = :id")
  Future<ServiceProvider?> getServiceProviderbyCateid(int id);
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
