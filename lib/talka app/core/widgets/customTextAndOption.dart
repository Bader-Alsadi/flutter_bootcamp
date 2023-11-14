import 'package:flutter/material.dart';

class customTextAndOptionText extends StatelessWidget {
  const customTextAndOptionText(
      {super.key, this.head = "اختبار", this.option = "(اختياري)"});

  final String? head, option;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(head!),
        Text(option!,
            style: TextStyle(
              color: Colors.grey,
            ))
      ],
    );
  }
}
