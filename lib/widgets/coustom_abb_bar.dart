import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget {
  customAppBar({super.key, this.title});
  String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: Icon(
        Icons.arrow_back,
        color: yellow,
      ),
      backgroundColor: secondary,
      title: Text(
        title!.toUpperCase(),
        style: TextStyle(color: white),
      ),
    );
  }
}
