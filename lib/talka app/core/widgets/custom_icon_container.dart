import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class CustomIconContaner extends StatelessWidget {
  CustomIconContaner({super.key, this.icon = Icons.hourglass_empty});
  late IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: miniSpacer * 2),
      decoration: BoxDecoration(
          color: primary, borderRadius: BorderRadius.circular(14)),
      child: Center(
          child: Icon(
        this.icon,
        size: 20,
      )),
    );
  }
}
