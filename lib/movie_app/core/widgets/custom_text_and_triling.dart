import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class customTextAndTriling extends StatelessWidget {
  customTextAndTriling(
      {super.key, this.labelFild = "", this.triling = "", this.islast = false});

  String labelFild;
  String triling;
  bool islast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: miniSpacer,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWithbold(),
            Text(triling),
          ],
        ),
        SizedBox(
          height: miniSpacer,
        ),
        Divider(
          thickness: 2,
          color: islast ? Colors.transparent : white.withOpacity(0.3),
        )
      ],
    );
  }

  Text textWithbold() {
    return Text(
      labelFild,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
