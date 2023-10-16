import 'package:bootcamp/home_page.dart';
import 'package:flutter/material.dart';

main() => Myapp();

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Hompage(),) ;
  }
}
