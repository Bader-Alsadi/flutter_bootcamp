import 'package:app/services_provider/core/them/text_style.dart';
import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  CustomHeading({super.key, this.title = ""});
  String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: normalTextbold,
      ),
      trailing: TextButton(onPressed: () {}, child: Text("المزيد")),
    );
  }
}
