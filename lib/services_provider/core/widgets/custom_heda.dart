import 'package:app/services_provider/core/them/colors.dart';
import 'package:flutter/material.dart';

class customHeadingSP extends StatelessWidget {
  customHeadingSP({super.key, this.head = ""});
  String head;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.0, right: 16.0, left: 16.0),
      child: Text(
        this.head,
        style: TextStyle(
            color: COLOR_PRIMARY, fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}