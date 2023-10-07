import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';

import '../modle/produc.dart';

class ProductDetails extends StatelessWidget {
  late ProductModel product;
  var con;
  ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    con = context;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Icon(
                Icons.arrow_back,
                color: secondary,
              ),
            ),
          ),
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
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
              padding: EdgeInsets.only(top: 20),
              child:
                  Text("Product detiles", style: TextStyle(color: secondary))),
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
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: white, boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.1),
                  offset: Offset(0, 1),
                  blurRadius: 1,
                )
              ]),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    getPictuer(url: product.thumbnail!),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${product.title}",
                      style: TextStyle(fontSize: 28),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "\$ ${product.price}",
                      style: TextStyle(fontSize: 21, color: red),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${product.description}",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              width: size.width - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primary,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                          )
                        ]),
                    height: 40,
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.remove),
                        Container(
                          child: Text("0"),
                        ),
                        Icon(Icons.add),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Add to cart",
                      style: TextStyle(color: white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getPictuer({required String url}) {
    var size = MediaQuery.of(con).size;
    return Container(
      height: 250,
      width: size.width - 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image:
              DecorationImage(image: AssetImage("$url"), fit: BoxFit.fill)),
    );
  }
}
