import 'package:flutter/material.dart';

class PrpfileScreen extends StatefulWidget {
  const PrpfileScreen({super.key});

  @override
  State<PrpfileScreen> createState() => _PrpfileScreenState();
}

class _PrpfileScreenState extends State<PrpfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "profile",
        style: TextStyle(color: Colors.red, fontSize: 30),
      ),
    );
  }
}