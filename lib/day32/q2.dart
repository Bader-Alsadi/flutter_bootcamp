import 'package:app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerChangeWidith extends StatefulWidget {
  const ContainerChangeWidith({super.key});

  @override
  State<ContainerChangeWidith> createState() => _ContainerChangeWidithState();
}

class _ContainerChangeWidithState extends State<ContainerChangeWidith> {
  double width = 300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        width = width == 300 ? 800 : 300;
        setState(() {});
      }),
      body: Center(
        child: AnimatedContainer(
            color: black,
            height: 300,
            width: width,
            duration: Duration(seconds: 1)),
      ),
    );
  }
}
