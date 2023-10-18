import 'package:app/day34_35/controler/product_control.dart';
import 'package:app/day34_35/models/product.dart';
import 'package:app/day34_35/pages/cart_list.dart';
import 'package:flutter/material.dart';

class ProudctList extends StatefulWidget {
  ProudctList({
    super.key,
  });

  @override
  State<ProudctList> createState() => _ProudctListState();
}

class _ProudctListState extends State<ProudctList> {
  List<Product> allProudct = [];
  List<Product> cartItems = List.empty(growable: true);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allProudct = ProductControl().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Produc list",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              // popupmenu item 1
              PopupMenuItem(
                value: 1,
                onTap: () async {
                  cartItems = await Navigator.push(context,
                      MaterialPageRoute(builder: (con) {
                    return CartList(cartList: cartItems);
                  }));
                  allProudct = ProductControl().editData(
                      productList: allProudct.map((e) {
                        e.isCheak = false;
                        return e;
                      }).toList(),
                      cartItems: cartItems);
                  setState(() {});
                },
                // row has two child icon and text.
                child: Row(
                  children: [
                    Text(
                      "show cart",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              // popupmenu item 2
              PopupMenuItem(
                value: 2,
                onTap: () {
                  allProudct = allProudct.map((e) {
                    e.isCheak = false;
                    return e;
                  }).toList();
                  cartItems.clear();
                  setState(() {});
                },
                // row has two child icon and text
                child: Row(
                  children: [
                    Text(
                      "clear cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
            offset: Offset(0, 0),
            color: Colors.black,
            // elevation: 2,
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
                itemBuilder: (context, index) => SizedBox(
                      child: InkWell(
                        onTap: () {
                          allProudct[index].isCheak =
                              !allProudct[index].isCheak;
                          if (allProudct[index].isCheak)
                            cartItems.add(allProudct[index]);
                          else
                            cartItems.remove(allProudct[index]);

                          setState(() {});
                        },
                        child: ListTile(
                          title: Text(allProudct[index].name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(allProudct[index].descrption),
                              Text(allProudct[index].price.toStringAsFixed(2)),
                            ],
                          ),
                          trailing: allProudct[index].isCheak
                              ? Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                )
                              : null,
                        ),
                      ),
                    ),
                separatorBuilder: (_, index) => Divider(),
                itemCount: allProudct.length),
          ),
        ),
      ),
    );
  }
}
