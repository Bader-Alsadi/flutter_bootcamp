import 'package:app/theme/colors.dart';
import 'package:app/theme/padding.dart';
import 'package:flutter/material.dart';

class customRichText extends StatelessWidget {
  customRichText(
      {super.key,
      required this.title,
      required this.subTitle,
      this.colorSubtitle = yellow,
      this.colorTitle = black});
  String title, subTitle;
  Color colorSubtitle;
  Color colorTitle;

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: "$title\n\n",
              style: TextStyle(fontSize: 20, color: colorTitle)),
          TextSpan(
              text: subTitle,
              style: TextStyle(fontSize: 25, color: colorSubtitle))
        ]));
  }
}
