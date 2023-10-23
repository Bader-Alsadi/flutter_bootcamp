import 'package:app/movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class custoumHeading extends StatelessWidget {
  custoumHeading(
      {super.key,
      this.headingText = "heading",
      this.trailingText = "trailing",
      this.mainColor = white});
  String headingText, trailingText;
  Color mainColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        headingText.toUpperCase(),
        style: TextStyle(color: mainColor, fontSize: 20),
      ),
      trailing: TextButton(
        onPressed: null,
        child: Text(
          trailingText.toUpperCase(),
          style: TextStyle(color: mainColor),
        ),
      ),
    );
  }
}
