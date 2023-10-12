import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';

import 'Porfile.dart';

class Ex3 extends StatelessWidget {
  Ex3({Key? key}) : super(key: key);
  List<Map<String, dynamic>> listTap = [
    {
      "name": "profile",
      "Icon": Icon(
        Icons.file_open,
        color: black,
      ),
    },
    {
      "name": "Feeds",
      "Icon": Icon(Icons.person, color: black),
    }
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primary,
          bottom: TabBar(
              tabs: List.generate(
            2,
            (index) => Tab(
                child: Text(
                  "${listTap[index]["name"]}",
                  style: TextStyle(color: black),
                ),
                icon: listTap[index]["Icon"]),
          )),
        ),
        body: TabBarView(
          children: [Porfile(), Text("feeds")],
        ),
      ),
    );
  }
}
