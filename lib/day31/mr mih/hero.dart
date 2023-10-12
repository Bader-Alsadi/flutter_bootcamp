import 'package:app/day31/mr%20mih/productDtiles.dart';
import 'package:flutter/material.dart';

class HeroEx extends StatefulWidget {
  const HeroEx({super.key});

  @override
  State<HeroEx> createState() => _HeroExState();
}

class _HeroExState extends State<HeroEx> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) {
            return productDit();
          }));
        },
        child: Center(
            child: Hero(
          tag: "iphone",
          child: Image.asset("assets/image/7.jpg"),
        )),
      ),
    );
  }
}
