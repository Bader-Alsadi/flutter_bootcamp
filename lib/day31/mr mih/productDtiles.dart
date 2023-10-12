import 'package:flutter/material.dart';

class productDit extends StatefulWidget {
  const productDit({super.key});

  @override
  State<productDit> createState() => _productDitState();
}

class _productDitState extends State<productDit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Hero(
        tag: "iphone",
        child: Image.asset(
          "assets/image/7.jpg",
          height: 100,
        ),
      )),
    );
  }
}
