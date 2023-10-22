import 'package:app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DragabaleEx extends StatefulWidget {
  const DragabaleEx({super.key});

  @override
  State<DragabaleEx> createState() => _DragabaleExState();
}

class _DragabaleExState extends State<DragabaleEx> {
  Color Changeco = black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Draggable(
            data: yellow,
            child: Container(
              color: yellow,
              height: 200,
              width: 200,
              child: Center(
                child: Text(
                  "Dragbox",
                  style: TextStyle(color: black, fontSize: 30),
                ),
              ),
            ),
            feedback: Container(
              color: yellow,
              height: 200,
              width: 200,
              child: Center(
                child: Material(
                  color: yellow,
                  child: Text(
                    "Dragbox",
                    style: TextStyle(color: black, fontSize: 30),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          DragTarget<Color>(
            builder: (
              BuildContext context,
              List onAccept,
              List regects,
            ) {
              return Container(
                color: Changeco,
                height: 250,
                width: 250,
                child: Center(
                  child: Text(
                    "DragTarget",
                    style: TextStyle(
                        color: Changeco == black ? white : black, fontSize: 40),
                  ),
                ),
              );
            },
            onAccept: (data) {
              Changeco = data;
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
