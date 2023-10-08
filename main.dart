import 'package:app/amle/Ex2.dart';
import 'package:app/amle/ex1.dart';
import 'package:app/amle/ex3.dart';
import 'package:app/day28_ecx/q1.dart';
import 'package:app/mr%20moh/form_login.dart';
import 'package:app/mr%20moh/stateFul.dart';
import 'package:app/view/ProductShow.dart';
import 'package:app/view/route_app.dart';
import 'package:app/mangerRoutes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConvortConst(),
      debugShowCheckedModeBanner: false,
      // initialRoute: "/home",
      onGenerateRoute: RouteManger.generRoute,
    );
  }
}
