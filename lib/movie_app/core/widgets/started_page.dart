import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class StartedPage extends StatelessWidget {
  StartedPage({super.key, required this.pageData});
  late Map<String, dynamic> pageData;
  @override
  Widget build(BuildContext context) {
    return Container(
      // foregroundDecoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage("assets/image/movise/movies5.jpg"),
      //         fit: BoxFit.cover)),
      padding:
          EdgeInsets.only(bottom: 200, left: smallSpacer, right: smallSpacer),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              pageData["icon"],
              color: yellow,
              size: 80,
            ),
            Text(
              (pageData["title"] as String).toUpperCase(),
              style: TextStyle(color: white, fontSize: 30),
            ),
            SizedBox(
              height: miniSpacer,
            ),
            SizedBox(
              height: miniSpacer,
            ),
            Text(
              pageData["descrotion"],
              style: TextStyle(color: white.withOpacity(0.6), fontSize: 20),
            )
          ]),
    );
  }
}
