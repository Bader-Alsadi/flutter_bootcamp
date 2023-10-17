import 'package:app/day34_35/controler/product_control.dart';
import 'package:app/day34_35/models/product.dart';
import 'package:flutter/material.dart';

class CartList extends StatefulWidget {
  CartList({super.key, required this.cartList});
  late List<Product> cartList;

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, widget.cartList);
        return new Future(() => true);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "cart list",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Flexible(
              child: widget.cartList.isNotEmpty
                  ? SizedBox(
                      child: ListView.separated(
                          itemBuilder: (context, index) => SizedBox(
                                child: ListTile(
                                  title: Text(widget.cartList[index].name),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.cartList[index].descrption),
                                      Text(widget.cartList[index].price
                                          .toStringAsFixed(2)),
                                    ],
                                  ),
                                  trailing: widget.cartList[index].isCheak
                                      ? InkWell(
                                          onTap: () {
                                            widget.cartList
                                                .remove(widget.cartList[index]);

                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        )
                                      : null,
                                ),
                              ),
                          // : SizedBox(),
                          separatorBuilder: (_, index) => Divider(),
                          itemCount: widget.cartList.length),
                    )
                  : Center(
                      child: Text("no items".toUpperCase(),
                          style: TextStyle(fontSize: 40)),
                    ),
            ),
            Divider(),
            Container(
              height: 79,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("conform")),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Total Preic : ",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: ProductControl()
                            .getTotal(cartItems: widget.cartList)
                            .toStringAsFixed(2),
                        style: TextStyle(color: Colors.black)),
                  ])),
                  ElevatedButton(
                      onPressed: () {
                        widget.cartList.clear();
                        setState(() {});
                      },
                      child: Text("clear cart")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
