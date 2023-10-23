import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class CustomListTileDivece extends StatelessWidget {
  const CustomListTileDivece({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "divece".toUpperCase(),
        textAlign: TextAlign.start,
        style: TextStyle(color: white, fontSize: 17),
      ),
      subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.4,
              height: smallSpacer,
              child: Text(
                "Screen you can watch from any where",
                style: TextStyle(color: white.withOpacity(0.5)),
              ),
            ),
            Text(
              "Chosce number of divece ",
              style: TextStyle(color: white, fontSize: 17),
            ),
          ]),
      trailing: Column(
        children: [
          SizedBox(
            height: smallSpacer + 2,
          ),
          Icon(
            Icons.arrow_drop_down,
            color: white,
          ),
        ],
      ),
    );
  }
}
