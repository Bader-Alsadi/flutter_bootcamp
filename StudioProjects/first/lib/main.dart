import 'package:flutter/material.dart';

void main () { runApp(my_first());}

class my_first extends StatelessWidget {
  const my_first({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "my first app",
      home: Scaffold(
        appBar: AppBar(
          title: Text(" My fisrt app"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              titlesection,
              text_section,
            ],
          ),
        ),
      ),
    );
  }
}

Widget titlesection = Container (
  padding: EdgeInsets.all(30),
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 8),
              child: Text("my first app",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
              
            ),
            Text("bader alsady",
            style: TextStyle(
              color: Colors.grey,
            ),
            )
          ],
        ),
      ),
      Icon(Icons.star,
      color: Colors.red ,),
      Text("51"),
    ],
  ),
);

Widget text_section = Container(
  padding: EdgeInsets.all(8),
  child: Text("hi my name is bader ,i am from Yemen , i am 24 years old hi my name is bader ,i am from Yemen , i am 24 years old hi my name is bader ,i am from Yemen , i am 24 years old hi my name is bader ,i am from Yemen , i am 24 years old hi my name is bader ,i am from Yemen , i am 24 years old hi my name is bader ,i am from Yemen , i am 24 years old",
  softWrap: true,),
);

