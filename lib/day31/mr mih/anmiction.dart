import 'package:flutter/material.dart';

class Anmiction extends StatefulWidget {
  const Anmiction({super.key});

  @override
  State<Anmiction> createState() => _AnmictionState();
}

class _AnmictionState extends State<Anmiction> {
  @override
double width=100,height=100;
Color color = Colors.red;
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 3),
        color: color,
        width: width,
        height: height,

      ),
    );
  }
}