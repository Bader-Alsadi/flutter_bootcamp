import 'package:app/talka%20app/core/theme/color.dart';
import 'package:flutter/material.dart';

class customTabbarContainer extends StatelessWidget {
  customTabbarContainer(
      {super.key, required this.index, required this.selectPage});
  late int index, selectPage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 180,
      decoration: BoxDecoration(
          color: index == selectPage ? orange : white,
          borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: Text(
          "مطتعم",
          style: TextStyle(color: index == selectPage ? white : black),
        ),
      ),
    );
  }
}
