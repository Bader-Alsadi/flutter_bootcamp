import 'package:app/models/product.dart';
import 'package:app/pages/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartList extends StatefulWidget {
  CartList({super.key, required this.cartList});
  late List<Product> cartList;

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  List<Product> viewList = [];

  @override
  Widget build(BuildContext context) {
    viewList = widget.cartList
        .where(
          (element) => element.isCheak,
        )
        .toList();
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
        body: Container(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      // widget.cartList[index].isCheak
                      SizedBox(
                        child: ListTile(
                          title: Text(widget.cartList[index].name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.cartList[index].descrption),
                              Text(widget.cartList[index].price
                                  .toStringAsFixed(2)),
                            ],
                          ),
                          trailing: widget.cartList[index].isCheak
                              ? InkWell(
                                  onTap: () {
                                    widget.cartList[index].isCheak = false;
                                    viewList[index].isCheak = false;
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
                  itemCount: viewList.length),
            ),
          ),
        ),
      ),
    );
  }
}
