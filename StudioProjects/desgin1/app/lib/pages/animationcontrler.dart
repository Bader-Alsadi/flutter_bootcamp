// import 'dart:ffi';

import 'package:flutter/material.dart';

class AnimtedCont extends StatefulWidget {
  const AnimtedCont({super.key});

  @override
  State<AnimtedCont> createState() => _AnimtedContState();
}

class _AnimtedContState extends State<AnimtedCont>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Color?> coloran;
  late Animation<double?> sizean;
  double slidValue = 0;
  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    coloran = ColorTween(begin: Colors.grey, end: Colors.red)
        .animate(animationController);

    sizean = TweenSequence<double?>([
      TweenSequenceItem<double>(tween: Tween(begin: 50, end: 90), weight: 5),
      TweenSequenceItem<double>(tween: Tween(begin: 90, end: 50), weight: 5),
    ]).animate(animationController);
    animationController.addListener(() {
      print(sizean.value);
    });

    // animatedContainer.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: animationController,
        builder: (cou, _) => Center(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  // if (animatedContainer.status == AnimationStatus.completed)
                  if (animationController.isCompleted)
                    animationController.reverse();
                  else
                    animationController.forward();
                },
                child: Icon(
                  Icons.favorite,
                  size: sizean.value,
                  color: coloran.value,
                ),
              ),
              Transform.rotate(
                angle: slidValue,
                child: Image.asset("assets/image/index.jpeg"),
              ),
              Slider(
                  max: 3.14,
                  min: 0,
                  value: slidValue,
                  onChanged: (v) {
                    slidValue = v;
                    setState(() {});
                  })
            ],
          ),
        ),
      ),
    );
  }
}
