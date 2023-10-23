import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class customTextAndTriling extends StatelessWidget {
  customTextAndTriling({super.key, this.labelFild = "", this.triling = ""});

  String labelFild;

  String triling;

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
