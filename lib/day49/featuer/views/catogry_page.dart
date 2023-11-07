import 'package:app/day49/featuer/contoller/catogry_contoller.dart';
import 'package:app/day49/featuer/views/product_list.dart';
import 'package:flutter/material.dart';

class GatogryList extends StatefulWidget {
  const GatogryList({super.key});

  @override
  State<GatogryList> createState() => _GatogryListState();
}

class _GatogryListState extends State<GatogryList> {
  CatogaryContoller catogaryContoller = CatogaryContoller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: catogaryContoller.fetuchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Wrap(
                children: List.generate(
                    snapshot.data!.length,
                    (index) => InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return productList(
                              category: snapshot.data![index],
                            );
                          }));
                        },
                        child: Chip(label: Text(snapshot.data![index])))),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
