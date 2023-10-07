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
      home: ProdcutView(),
      debugShowCheckedModeBanner: false,
      // initialRoute: "/home",
      onGenerateRoute: RouteManger.generRoute,
    );
  }
}
