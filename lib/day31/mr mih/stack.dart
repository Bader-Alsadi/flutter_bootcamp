import 'package:flutter/material.dart';

class stackAn extends StatefulWidget {
  const stackAn({super.key});

  @override
  State<stackAn> createState() => _stackAnState();
}

class _stackAnState extends State<stackAn> {
  double top = 0, left = 0, rigth = 0, buttom = 0;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 2;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(alignment: Alignment.bottomLeft, children: [
          Container(
            width: width,
            height: height,
            color: Colors.green,
          ),
          AnimatedPositioned(
              top: top,
              left: left,
              // right: rigth,
              // bottom: buttom,
              child: Container(
                width: 80,
                height: 30,
                color: Colors.red,
              ),
              duration: Duration(seconds: 3))
        ]),
        SizedBox(
          height: 50,
        ),
        ElevatedButton(
            onPressed: () {
              if (left==0&&top==0) left += width - 30;
             else if (left==width - 30&&top==0) top +=  height - 30;
             else if (left==width - 30&&top== height - 30) left = 0;
              else if (left==0&&top== height - 30) top =0;

              setState(() {});
            },
            child: Text("move"))
      ],
    );
  }
}
