import 'package:app/day55/featuer/notever.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class changeColor extends StatefulWidget {
  const changeColor({super.key});

  @override
  State<changeColor> createState() => _changeColorState();
}

class _changeColorState extends State<changeColor> {
  NotifierColor m = NotifierColor.getObject();
  Color? groubeValu;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: groubeValu,
          ),
      body: Column(children: [
        RadioListTile(
            value: Colors.red,
            groupValue: groubeValu,
            title: Text("red"),
            onChanged: (value) {
              groubeValu = value!;
              m.setValu(value!);

              setState(() {});
            }),
        RadioListTile(
            value: Colors.yellow,
            groupValue: groubeValu,
            title: Text("yellow"),
            onChanged: (value) {
              groubeValu = value!;
              m.setValu(value);
              setState(() {});
            }),
        RadioListTile(
            value: Colors.green,
            groupValue: groubeValu,
            title: Text("green"),
            onChanged: (value) {
              groubeValu = value!;
              m.setValu(value);
              setState(() {});
            }),
      ]),
    );
  }

  // setValu(Color color) async {
  //   SharedPreferences pre = await SharedPreferences.getInstance();
  //   await pre.setInt("color", color.value);

  //   setState(() {});
  //   setcolor();
  // }

  // setcolor() async {
  //   SharedPreferences pre = await SharedPreferences.getInstance();
  //   groubeValu = Color(await pre.getInt("color")!);
  //   setState(() {});
  // }
}
