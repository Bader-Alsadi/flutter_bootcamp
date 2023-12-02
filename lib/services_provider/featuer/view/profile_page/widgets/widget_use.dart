import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/core/them/text_style.dart';
import 'package:flutter/material.dart';

class CustomHaedValue extends StatelessWidget {
  CustomHaedValue({super.key, this.head = "", this.value = ""});
  String head, value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: COLOR_PRIMARY.withOpacity(0.1),
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            Text(
              head,
              style: normalTextbold,
            ),
            Text(
              value,
              style: normalTextbold,
            ),
          ],
        ),
      ),
    );
  }
}

class Custom_about extends StatelessWidget {
  Custom_about({super.key, this.textValue = ""});

  String textValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: COLOR_PRIMARY.withOpacity(0.2),
          borderRadius: BorderRadius.circular(25)),
      margin: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'تفاصيل ',
            style: normalTextbold,
          ),
          const SizedBox(height: 16),
          Text(
            this.textValue,
            style:
                normalText.copyWith(height: 1.6, color: black.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
