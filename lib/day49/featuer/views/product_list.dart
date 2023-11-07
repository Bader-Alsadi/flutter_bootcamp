import 'package:app/day49/featuer/contoller/product_Comtoler.dart';
import 'package:flutter/material.dart';

class productList extends StatefulWidget {
  productList({this.category = "", super.key});
  String category;

  @override
  State<productList> createState() => _productListState();
}

class _productListState extends State<productList> {
  ProductContoller productContoller = ProductContoller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: productContoller.fetuchData(category: widget.category),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => Card(
                        child: Column(
                          children: [
                            ClipRRect(
                              child: Image.network(
                                snapshot.data![index].image!,
                                height: 100,
                              ),
                            ),
                            ListTile(
                              title: Text(snapshot.data![index].title!),
                              subtitle: Text(snapshot.data![index].category!),
                            )
                          ],
                        ),
                      ));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
