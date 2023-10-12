import 'package:app/day31/mr%20mih/stack.dart';
import 'package:app/day32/q1.dart';
import 'package:app/day32/q2.dart';
import 'package:app/day_26/Ex2.dart';
import 'package:app/day_26/ex3.dart';
import 'package:app/mr%20moh/app_day30/favfiret.dart';
import 'package:app/mr%20moh/app_day30/home_screen.dart';
import 'package:app/mr%20moh/app_day30/profile.dart';
import 'package:app/mr%20moh/app_day30/settin.dart';
import 'package:app/pakages/flutter_toust.dart';
import 'package:app/pakages/image_picker.dart';
import 'package:app/pakages/pachage_botoom.dart';
import 'package:app/pakages/spinke.dart';
import 'package:flutter/material.dart';

class Man_page extends StatefulWidget {
  const Man_page({super.key});

  @override
  State<Man_page> createState() => _Man_pageState();
}

class _Man_pageState extends State<Man_page> {
  List<Widget> screens = [
    HomeScreen1(),
    FavScreen(),
    SettingScreen(),
    PrpfileScreen()
  ];
  int screenindex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Anmitedcon(),

        // bottomNavigationBar: BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   currentIndex: screenindex,
        //   onTap: (x){
        //     screenindex=x;
        //     setState(() {

        //     });
        //   },
        //   items: [
        //   BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
        //   BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "favorite"),
        //   BottomNavigationBarItem(icon: Icon(Icons.settings),label: "settings"),
        //   BottomNavigationBarItem(icon: Icon(Icons.person_off),label: "profile"),
        // ]),),
      ),
    );
  }
}
