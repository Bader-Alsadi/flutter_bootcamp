import 'package:app/day40/faetuer/contolers/order_contoler.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late OrderContoller _orderContoller;
  @override
  void initState() {
    _orderContoller = OrderContoller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: _orderContoller.featchOrder(),
          builder: (context, sanpshot) {
            if (sanpshot.connectionState == ConnectionState.done)
              return ListView.builder(
                  itemCount: sanpshot.data?.length,
                  itemBuilder: (context, index) => Container(
                        child: Text(
                            _orderContoller.allOrders[index].id.toString()),
                      ));
            else
              return Center(
                child: CircularProgressIndicator(),
              );
          }),
    );
  }
}
