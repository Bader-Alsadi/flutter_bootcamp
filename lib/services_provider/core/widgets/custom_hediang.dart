
import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  CustomHeading({super.key, this.title = ""});
  String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: TextButton(onPressed: () {}, child: Text("View all")),
    );
  }
}
