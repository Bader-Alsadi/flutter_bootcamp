import 'package:flutter/material.dart';

class AnimationEx extends StatefulWidget {
  AnimationEx({required this.context1, super.key});
  late BuildContext context1;

  @override
  State<AnimationEx> createState() => _AnimationExState();
}

class _AnimationExState extends State<AnimationEx>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController; 
  late Animation<double?> heigth;
  // late Animation<double?> heigthC2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    heigth = Tween<double>(
            begin: 0, end: MediaQuery.of(widget.context1).size.height / 2)
        .animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
            animation: animationController,
            builder: (co, _) => inkwellwid(
                  widget.context1,
                )));
  }

  InkWell inkwellwid(BuildContext context) {
    return InkWell(
      onTap: () {
        if (animationController.isCompleted)
          animationController.reverse();
        else
          animationController.forward();
      },
      child: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.blue,
          )),
          Container(
            color: Colors.red,
            height: heigth.value,
          )
        ],
      ),
    );
  }

  // setvalu(BuildContext context){

  // }
}
