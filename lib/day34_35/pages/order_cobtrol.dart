import 'package:app/day34_35/models/order.dart';

class OrderControl {
  List<Order> _allOrder =[];


 List<Order> get allOrder => this._allOrder;

 

  void addOrder(Order order) {
    _allOrder.add(order);
  }

  void removOrder(String id) {
    int index = _allOrder.indexWhere((element) => element.id == id);
    if (index != -1)
      _allOrder.removeAt(index);
    else
      print("not found");
  }

  // List<Order> getListOrde() {
  //   return _allOrder;
  // }
}
