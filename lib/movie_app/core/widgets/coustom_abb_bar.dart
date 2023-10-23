import 'package:app/movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget {
  customAppBar({super.key, this.title, this.elevation = 0});
  String? title;
  double elevation;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: this.elevation,
      leading: Icon(
        Icons.arrow_back,
        color: yellow,
      ),
      backgroundColor: secondary,
      title: Text(
        title!.toUpperCase(),
        style: TextStyle(color: white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
