import 'package:app/day74/featuer/viewModel/product_vm.dart';
import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  ProductVM pvm = Get.put(ProductVM());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ge x"),
        ),
        body: GetBuilder<ProductVM>(
          builder: (p) => Container(
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                  decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(" whish list ${pvm.whishList.length}"),
                ),
                Column(
                  children: pvm.allproduct
                      .map((e) => Card(
                            color: Colors.blue[100],
                            child: ListTile(
                              trailing: InkWell(
                                  onTap: () {
                                    if (e.isSelect) {
                                      pvm.removeowhishLis(e);
                                    } else {
                                      pvm.AddtowhishLis(e);
                                    }
                                    e.isSelect = !e.isSelect;
                                  },
                                  child: Icon(
                                    Icons.favorite,
                                    color:
                                        e.isSelect ? Colors.red : Colors.grey,
                                  )),
                              title: Text(e.name),
                              subtitle: Text("\$ ${e.price} "),
                            ),
                          ))
                      .toList(),
                )
              ]),
            ),
          ),
        ));
  }
}
