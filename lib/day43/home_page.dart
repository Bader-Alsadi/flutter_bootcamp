import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: lodeRespons(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<dynamic> products = jsonDecode(snapshot.data!)["products"];
                return ListView.builder(
                  itemBuilder: (context, index) => Card(
                    child: Column(
                      children: [
                        Image.network(
                          products[index]["thumbnail"],
                          fit: BoxFit.fill,
                        ),
                        Row(
                          children: [
                            Text(products[index]["title"]),
                            Spacer(),
                            Text(products[index]["price"].toString())
                          ],
                        )
                      ],
                    ),
                  ),
                  itemCount: products.length,
                );
              } else {
                return Center(
                  child: Text("no data"),
                );
              }
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          }),
    );
  }

  Future<String?> lodeRespons() async {
    Dio dio = Dio();

    Response<String> dataFromServer =
        await dio.get("https://dummyjson.com/products");
    return dataFromServer.data;
  }
}
