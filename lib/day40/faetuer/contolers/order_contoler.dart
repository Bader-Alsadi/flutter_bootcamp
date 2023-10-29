
import 'package:app/day40/faetuer/models/database.dart';
import 'package:app/day40/faetuer/models/order_model.dart';

class OrderContoller{
  //  Order order =Order();
   List<Order> allOrders = [];
Future<List<Order>?> featchOrder()async{
  await Future.delayed(Duration(seconds: 5));
    DatabaseManger doObject = DatabaseManger();
    allOrders = doObject.cartItem.map((e) => Order.fromJson(e)).toList();

    return allOrders;
  
}


// Future<List<Order>?> featchOrder ()async{
//   await Future.delayed(Duration(se)){
//   DatabaseManger.
//     allOrders= doObject.cartItem.
    
//   }
} 
