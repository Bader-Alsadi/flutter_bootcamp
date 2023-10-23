import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class StartCreatePage extends StatelessWidget {
  StartCreatePage({super.key, required this.pageData});
  late Map<String, dynamic> pageData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 100,
      ),
      child: Column(children: [
        Icon(
          pageData["icon"],
          color: yellow,
          size: 80,
        ),
        Text(
          (pageData["title"] as String).toUpperCase(),
          style: TextStyle(color: white, fontSize: 25),
          textAlign: TextAlign.center,
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
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
