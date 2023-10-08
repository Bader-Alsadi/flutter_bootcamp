import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listImage = [
    "1.jpg",
    "2.jpg",
    "3.jpg",
  ];
  int number = 0;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(
            child: Text("$count"),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Center(
          child: InkWell(
              onTap: () {
                count++;
                number++;
                if (number == listImage.length) number = 0;
                setState(() {});
              },
              child: Image.asset("assets/image/${listImage[number]}"))),
    );
  }
}
