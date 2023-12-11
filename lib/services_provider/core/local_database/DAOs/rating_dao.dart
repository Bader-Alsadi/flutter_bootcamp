import 'package:app/services_provider/core/local_database/entities/rating_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class RatingDao {
  @Query("select * from Rating ")
  Future<List<Rating>> getAllRating();
  @Query("select * from Rating where Service_id = :id")
  Future<Rating?> getRatingbyid(int id);
  @Query("select * from Rating where Rating_name =:keyword")
  Future<List<Rating>> getRatingByname(String keyword);
  @insert
  Future<int> insertRating(Rating rating);
  @update
  Future<int> updateRating(Rating rating);
  @delete
  Future<int> deleteRating(Rating rating);
  @Query("delete from Rating where id = :id")
  Future<int?> deleteRatingByid(int id);
}
