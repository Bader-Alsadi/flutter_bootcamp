import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class customTitleSubtitle extends StatelessWidget {
  customTitleSubtitle(
      {super.key,
      required this.tilte,
      required this.subtitle,
      this.titleColor,
      this.subtitlecolor});
  late String tilte;
  late String subtitle;
  Color? titleColor, subtitlecolor;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        tilte,
        style: TextStyle(color: titleColor == null ? white : titleColor),
      ),
      SizedBox(
        height: miniSpacer,
      ),
      Text(
        subtitle,
        style: TextStyle(
            color: subtitlecolor == null ? Colors.grey : subtitlecolor),
      ),
    ]);
  }
}
