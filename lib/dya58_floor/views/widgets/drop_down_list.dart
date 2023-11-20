import 'package:app/dya58_floor/theme/text_style.dart';
import 'package:app/dya58_floor/theme/them_app.dart';
import 'package:flutter/material.dart';

class CoustomContianer extends StatelessWidget {
  CoustomContianer(
      {super.key,
      this.lable = " ",
      required this.widgetSend,
      this.withBorder = true});
  String lable;
  bool withBorder;
  Widget widgetSend;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable,
          style: subTitle,
        ),
        SizedBox(
          height: minPadding,
        ),
        Container(
          height: 50,
          padding: withBorder ? EdgeInsets.all(minPadding) : null,
          decoration: BoxDecoration(
            border: Border.all(
              color: withBorder ? primary : white,
            ),
            borderRadius: BorderRadius.circular(radio),
          ),
          child: widgetSend,
        ),
      ],
    );
  }
}
