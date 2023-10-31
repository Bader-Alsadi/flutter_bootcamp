
import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  CustomHeading(
      {super.key,
      this.heading = "لا يوجد نص",
      this.icon = null,
      this.triling = null});
  String heading;
  Icon? icon;
  Widget? triling;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon == null ? Icon(Icons.cancel) : icon!,
        Text(heading),
        Spacer(),
        triling == null ? Container() : triling!
      ],
    );
  }
}