import 'package:flutter/material.dart';

class Exe1 extends StatelessWidget {
  const Exe1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
          // mainAxisAlignment: MainAxisAlignment.values.st,
          children: [
            expandre(str: "1",color1: Colors.pinkAccent ),
            Expanded(
              child: Row(
                children: [
                  expandre(str: "2",color1: Colors.green ),
                  Expanded(
                    child: Column(
                      children: [
                        expandre(str: "3",color1: Colors.yellow ),
                        expandre(str: "4",color1: Colors.purple ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]);
  }}
Widget expandre ({required String str ,required Color color1}){
  print(str);
  return Expanded(child: Container(
    decoration: BoxDecoration(
      color: color1,
    ),
    child: Center(child: Text(str.toString(),style: TextStyle(fontWeight: FontWeight.bold,
    color: Colors.black),
    ),
    ),
  ));
}