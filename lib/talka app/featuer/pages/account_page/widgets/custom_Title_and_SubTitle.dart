import 'package:flutter/material.dart';

class customTitleAndSubtitle extends StatelessWidget {
  customTitleAndSubtitle({
    super.key,
    this.subTitle = "0",
    this.title = "",
  });
  late String subTitle, title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          subTitle,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
