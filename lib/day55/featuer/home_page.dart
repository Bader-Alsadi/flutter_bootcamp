import 'dart:ui';

import 'package:app/day55/featuer/changeColor.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageP extends StatefulWidget {
  const HomePageP({super.key});

  @override
  State<HomePageP> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageP> {
  String? name;
  String? gmail;
  Color? color;
  @override
  void initState() {
    super.initState();
    setValue();
  }

  @override
  Widget build(BuildContext context) {
    setValue();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return changeColor();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.settings),
                )),
          ],
        ),
        body: FutureBuilder(
            future: setValue(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: smallSpacer,
                      ),
                      Text("Name: $name! "),
                      Text("Emale: $gmail! "),
                      SizedBox(
                        height: miniSpacer,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        color: color,
                      )
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  setValue() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    name = await pre.getString("name");
    gmail = await pre.getString("gmail");
    color = Color(await pre.getInt("color")!);
    return name;
  }
}
