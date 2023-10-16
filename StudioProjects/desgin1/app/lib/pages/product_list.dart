import 'package:app/control/product_control.dart';
import 'package:app/models/product.dart';
import 'package:app/pages/cart_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProudctList extends StatefulWidget {
  ProudctList({
    super.key,
  });
  List<Product> allProudct = [];
  @override
  State<ProudctList> createState() => _ProudctListState();
}

class _ProudctListState extends State<ProudctList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.allProudct = ProductControl().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                  widget.allProudct = await Navigator.push(context,
                      MaterialPageRoute(builder: (con) {
                    return CartList(cartList: widget.allProudct);
                  }));
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
                  widget.allProudct = widget.allProudct.map((e) {
                    e.isCheak = false;
                    return e;
                  }).toList();
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
            offset: Offset(0, 100),
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
                          widget.allProudct[index].isCheak = true;

                          //  widget.allProudct[index].isCheak?widget.allProudct[index].isCheak=false
                          setState(() {});
                        },
                        child: ListTile(
                          title: Text(widget.allProudct[index].name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.allProudct[index].descrption),
                              Text(widget.allProudct[index].price
                                  .toStringAsFixed(2)),
                            ],
                          ),
                          trailing: widget.allProudct[index].isCheak
                              ? Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                )
                              : null,
                        ),
                      ),
                    ),
                separatorBuilder: (_, index) => Divider(),
                itemCount: widget.allProudct.length),
          ),
        ),
      ),
    );
  }
}
