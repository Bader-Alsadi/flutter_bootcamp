import 'package:app/talka%20app/featuer/pages/rout_page/root_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPoint());
}

class MainPoint extends StatelessWidget {
  const MainPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: dark,
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: RouteManger.generRoute,
      home: Directionality(textDirection: TextDirection.rtl, child: RootPage()),
    );
  }
}
