import 'package:app/T_moghter_database/core/helper/repositeries/online_repo.dart';
import 'package:app/T_moghter_database/featuers/viewModels/product_viewmodel.dart';
import 'package:flutter/material.dart';

class OnlineProdut extends StatefulWidget {
  const OnlineProdut({super.key});

  @override
  State<OnlineProdut> createState() => _OnlineProdutState();
}

class _OnlineProdutState extends State<OnlineProdut> {
  ProductViewmodel PVM = ProductViewmodel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: PVM.fetchProduct(OnlineREpo()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) => Card(
                        child: Column(
                          children: [
                            Image.network(snapshot.data![index].thumbnail!),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(snapshot.data![index].category.toString()),
                                Icon(Icons.favorite),
                                Text(snapshot.data![index].title!)
                              ],
                            )
                          ],
                        ),
                      )));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
