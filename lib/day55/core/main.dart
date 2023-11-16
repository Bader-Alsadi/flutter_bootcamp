import 'package:app/day55/featuer/home_page.dart';
import 'package:app/day55/featuer/login_page.dart';
import 'package:app/day55/featuer/notever.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NotifierColor m = NotifierColor.getObject();
  Color? color;

  reflech() {
    m.addListener(() async {
      print("insid le");
      color = await m.getColor();
      print("color  $color");
      setState(() {});
    });
  }

  String? name;

  @override
  Widget build(BuildContext context) {
    reflech();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorSchemeSeed: color ?? orange,
            appBarTheme: AppBarTheme(
              backgroundColor: color ?? orange,
            )),
        home: FutureBuilder(
            future: getvalur(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return name == null ? LoginP() : HomePageP();
              } else {
                return CircularProgressIndicator();
              }
            }));
  }

  Future getvalur() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    name = await pre.getString("name");
    print(name);
    return name;
  }
}
