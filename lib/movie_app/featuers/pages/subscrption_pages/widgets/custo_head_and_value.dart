import 'package:flutter/material.dart';

class CustomHeadAndValue extends StatelessWidget {
  CustomHeadAndValue({super.key, this.value = "value", this.head = "hedad"});
  String value, head;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value),
        Text(
          head,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }
}
