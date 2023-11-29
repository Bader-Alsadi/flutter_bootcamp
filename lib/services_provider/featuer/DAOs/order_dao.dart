import 'package:app/services_provider/featuer/entities/order_emtity.dart';
import 'package:floor/floor.dart';

@dao
abstract class OrderDao {
  @Query("select * from Order ")
  Future<List<Order>> getAllOrder();
  @Query("select * from Order where id = :id")
  Future<Order?> getOrderbyid(int id);
  @Query("select * from Order where Order_name =:keyword")
  Future<List<Order>> getOrderByname(String keyword);
  @insert
  Future<int> insertOrder(Order order);
  @update
  Future<int> updateOrder(Order order);
  @delete
  Future<int> deleteOrder(Order order);
  @Query("delete from Order where id = :id")
  Future<int?> deleteOrderByid(int id);
}
