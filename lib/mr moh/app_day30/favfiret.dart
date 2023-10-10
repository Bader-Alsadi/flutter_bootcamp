import 'package:flutter/material.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "favert",
        style: TextStyle(color: Colors.red, fontSize: 30),
      ),
    );
  }
}