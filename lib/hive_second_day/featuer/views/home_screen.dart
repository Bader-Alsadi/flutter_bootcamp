import 'package:app/hive_second_day/core/repositeries/product_hive_repo.dart';
import 'package:app/hive_second_day/featuer/viewModel/product_VM.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

class HomeScreenH extends StatefulWidget {
  const HomeScreenH({super.key});

  @override
  State<HomeScreenH> createState() => _HomeScreenHState();
}

class _HomeScreenHState extends State<HomeScreenH> {
  ProductVM PVM = ProductVM();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: PVM.fetchProuctsFromRepo(ProductHiveRepo(), "products"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, Index) => ListTile(
                  title: Text(snapshot.data![Index].title!),
                ),
                itemCount: snapshot.data!.length,
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
