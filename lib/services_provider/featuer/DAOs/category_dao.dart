import 'package:app/services_provider/featuer/entities/category_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class CategoryDao {
  @Query("select * from Category ")
  Future<List<Category>> getAllcategory();
  @Query("select * from Category where id = :id")
  Future<Category?> getcategorybyid(int id);
  @Query("select * from Category where category_name =:keyword")
  Future<List<Category>> getcategoryByname(String keyword);
  @insert
  Future<int> insertcategory(Category category);
  @update
  Future<int> updatecategory(Category category);
  @delete
  Future<int> deletecategory(Category category);
  @Query("delete from Category where id = :id")
  Future<int?> deletecategoryByid(int id);
}
