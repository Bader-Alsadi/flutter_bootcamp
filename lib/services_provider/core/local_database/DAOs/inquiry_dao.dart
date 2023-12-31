import 'package:app/services_provider/core/local_database/entities/inquiry_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class InquiryDao {
  @Query("select * from Inquiry ")
  Future<List<Inquiry>> getAllInquiry();
  @Query("select * from Inquiry where Service_provider_id = :id")
  Future<Inquiry?> getInquirybyid(int id);
  @Query("select * from Inquiry where Inquiry_name =:keyword")
  Future<List<Inquiry>> getInquiryByname(String keyword);
  @insert
  Future<int> insertInquiry(Inquiry inquiry);
  @update
  Future<int> updateInquiry(Inquiry inquiry);
  @delete
  Future<int> deleteInquiry(Inquiry inquiry);
  @Query("delete from Inquiry where id = :id")
  Future<int?> deleteInquiryByid(int id);
}
