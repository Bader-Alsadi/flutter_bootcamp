import 'package:app/services_provider/core/them/app_them.dart';
import 'package:app/services_provider/featuer/view/dashbord/dashborad.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ligth,
      title: 'Material App',
      home: Dashboard(),
    );
  }
}
