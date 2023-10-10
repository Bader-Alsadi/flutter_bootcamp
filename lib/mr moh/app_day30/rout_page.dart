import 'package:app/mr%20moh/app_day30/home_screen.dart';
import 'package:app/mr%20moh/app_day30/main_page.dart';
import 'package:app/mr%20moh/app_day30/q1.dart';
import 'package:app/mr%20moh/app_day30/q2.dart';
import 'package:app/mr%20moh/stateFul.dart';
import 'package:flutter/material.dart';

class Route_page extends StatefulWidget {
  const Route_page({super.key});

  @override
  State<Route_page> createState() => _HomePageState();
}

class _HomePageState extends State<Route_page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: ShowInfo(),
      )),
    );
  }
}
