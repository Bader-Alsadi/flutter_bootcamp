import 'package:app/day28_ecx/q2.dart';
import 'package:app/day28_ecx/q3/q3.dart';
import 'package:app/day29_exc/footboll/Tansfer_center.dart';
import 'package:app/day29_exc/footboll/homePag.dart';
import 'package:app/day29_exc/footboll/news.dart';
import 'package:app/day29_exc/searshPage.dart';
import 'package:app/day_26/Ex2.dart';
import 'package:app/day_26/ex1.dart';
import 'package:app/day_26/ex3.dart';
import 'package:app/day28_ecx/q1.dart';
import 'package:app/mr%20moh/app_day30/rout_page.dart';
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
    return Route_page();
    
    //
    // MaterialApp(
    //     home: News(),
    //     debugShowCheckedModeBanner: false,
    //     // initialRoute: "/home",
    //     onGenerateRoute: RouteManger.generRoute,
    //   );
  }
}
