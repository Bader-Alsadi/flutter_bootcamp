import 'package:app/control/product_control.dart';
import 'package:app/pages/animationcontrler.dart';
import 'package:app/pages/product_list.dart';
import 'package:app/pages/q1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: AnimationEx(context1: 
      context,)),
    );
  }
}
