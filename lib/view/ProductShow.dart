import 'package:app/control/custom.dart';
import 'package:app/modle/cart.dart';
import 'package:app/modle/coustem.dart';
import 'package:app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../control/proudctControl.dart';
import '../modle/produc.dart';

class ProdcutView extends StatelessWidget {
  ProdcutView({Key? key}) : super(key: key) {}

  ProductController pController = ProductController();

  // CoustomerControl coustomerControl = CoustomerControl();

  var con;

  int count = 0;

  List<ProductModel> listpro = [];

  @override
  @override
  Widget build(BuildContext context) {
    pController.getAllProducts();
    // coustomerControl.getAllCoustem();
    // Coustomer coustomer = coustomerControl.coustomers[1];

    // print(coustomerControl.coustomers.length);
    con = context;

    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 20,
                  child: Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: red,
                      boxShadow: [
                        BoxShadow(blurRadius: 1, offset: Offset(0.1, 1))
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "1",
                        style: TextStyle(color: primary, fontSize: 10),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/cart");
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, right: 20),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: secondary,
                    ),
                  ),
                ),
              ],
            )
          ],
          leading: Padding(
            padding: EdgeInsets.only(top: 20),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/image/index.jpeg"),
            ),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Products", style: TextStyle(color: secondary))),
          backgroundColor: primary,
          centerTitle: true,
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(con).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          getSearsh(text: "searsh for product here..."),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.format_list_bulleted_sharp,
                  color: black,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Center(
              child: Wrap(
                // alignment: WrapAlignment.spaceBetween,
                spacing: 20.0,
                // runAlignment: WrapAlignment.spaceBetween,
                runSpacing: 20.0,
                children: List.generate(
                    pController.products.length,
                    (index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(con, "/details",
                                arguments: pController.products[index]);
                          },
                          child: Container(
                            height: 200,
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 1,
                                  )
                                ]),
                            child: Column(children: [
                              Container(
                                height: 120,
                                width: 180,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "${pController.products[index].thumbnail}"),
                                        fit: BoxFit.fill)),
                              ),
                              Container(
                                decoration:
                                    BoxDecoration(color: white, boxShadow: []),
                                child: ListTile(
                                  trailing: GestureDetector(
                                    onTap: () {},
                                    child: Icon(Icons.add_shopping_cart_sharp),
                                  ),
                                  title: Text(
                                      "${pController.products[index].title}"),
                                  subtitle: Text(
                                    "\$ ${pController.products[index].price}",
                                    style: TextStyle(fontSize: 13, color: red),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getSearsh({required String text}) {
    var size = MediaQuery.of(con).size;
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 45,
        width: size.width - 40,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: black.withOpacity(0.3), blurRadius: 1)
            ]),
        child: Row(children: [
          Icon(
            Icons.search,
            color: black,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "$text",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
          )
        ]),
      ),
    );
  }
}
