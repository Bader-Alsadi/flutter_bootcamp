import 'dart:ffi';
import 'dart:math';

import 'package:app/theme/colors.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Anmitedcon extends StatefulWidget {
  const Anmitedcon({super.key});

  @override
  State<Anmitedcon> createState() => _AnmitedconState();
}

class _AnmitedconState extends State<Anmitedcon> {
  // dynamic tweenType = 0.0;
  double height = 100, width = 100;
  Color? beginColor = Colors.yellow;
  List<Color> colors = List.generate(
      11,
      (index) => Color.fromARGB(
            Random().nextInt(255),
            Random().nextInt(255),
            Random().nextInt(255),
            Random().nextInt(255),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // tweenChang(tweenType),
          SizedBox(
            height: 30,
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            width: width,
            height: height,
            color: beginColor,
          ),
          SizedBox(
            height: 50,
          ),
          ButtonBar(
            children: [
              ElevatedButton(
                  onPressed: () {
                    // tweenType = white;
                    beginColor = colors[Random().nextInt(9)];
                    setState(() {});
                  },
                  child: Text("change color")),
              ElevatedButton(
                  onPressed: () {
                    // tweenType = 0.0;
                    width = Random().nextDouble() * 300;
                    height = Random().nextDouble() * 400;
                    setState(() {});
                  },
                  child: Text("change size")),
              ElevatedButton(
                  onPressed: () {
                    // tweenType = 0;
                    beginColor = colors[Random().nextInt(9)];
                    width = Random().nextDouble() * 300;
                    height = Random().nextDouble() * 400;
                    setState(() {});
                  },
                  child: Text("change both")),
            ],
          )
        ],
      ),
    );
  }

  // Widget tweenChang<T>(T ty) {
  //   if (ty.runtimeType == Color) {
  //     beginColor = colors[Random().nextInt(10)];
  //     endColor = colors[Random().nextInt(10)];
  //     return TweenAnimationBuilder<Color?>(
  //       duration: const Duration(seconds: 3),
  //       tween: ColorTween(begin: beginColor!, end: endColor!),
  //       builder: (BuildContext context, dynamic value, Widget? child) {
  //         return Container(
  //           color: value ?? Colors.transparent,
  //           width: width,
  //           height: height,
  //         );
  //       },
  //     );
  //   } else if (ty.runtimeType == double) {
  //     // height = Random().nextDouble() * 400;
  //     width = Random().nextDouble() * 200;
  //     return TweenAnimationBuilder(
  //       duration: const Duration(seconds: 2),
  //       tween: Tween<double>(begin: height, end: width),
  //       builder: (BuildContext context, dynamic value, Widget? child) {
  //         return Container(
  //           color: beginColor,
  //           width: value,
  //           height: value,
  //         );
  //       },
  //     );
  //   } else
  //     return TweenAnimationBuilder<int>(
  //       duration: const Duration(seconds: 2),
  //       tween: IntTween(begin: 0, end: 1),
  //       builder: (_, int value, __) {
  //         return Container(
  //           color: colors[Random().nextInt(10)],
  //           width: value.toDouble() * 50.0,
  //           height: value.toDouble() * 50.0,
  //         );
  //       },
  //     );
  // }
}
