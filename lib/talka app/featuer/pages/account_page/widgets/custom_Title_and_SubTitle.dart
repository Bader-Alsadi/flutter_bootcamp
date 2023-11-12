import 'package:app/movie_app/core/theme/padding.dart';
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
          // style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: miniSpacer / 2,
        ),
        Text(
          subTitle,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        )
      ],
    );
  }
}
