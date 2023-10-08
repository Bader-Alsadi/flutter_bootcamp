import 'package:app/tap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Porfile.dart';

class Ex3 extends StatelessWidget {
  const Ex3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          title: Text(
            "metre app bar",
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(padding: EdgeInsets.only(top: 15), tabs: [
            Tab(
                child: Text(
                  "Profile",
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(
                  Icons.file_open,
                  color: Colors.black,
                )),
            Tab(
                child: Text(
                  "Feeds",
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ))
          ]),
        ),
        body: TabBarView(
          children: [Porfile(), Text("feeds")],
        ),
      ),
    );
  }
}
