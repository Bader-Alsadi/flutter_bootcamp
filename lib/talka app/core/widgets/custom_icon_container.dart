import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class CustomIconContaner extends StatelessWidget {
  CustomIconContaner(
      {super.key,
      this.icon = Icons.hourglass_empty,
      this.height = 50,
      this.size = 20,
      this.backgroundColor = primary,
      this.borderRAdiusValue = borderRaduis,
      this.iconColor = black,
      this.padding = miniSpacer * 2});
  late IconData icon;
  double height, size, padding, borderRAdiusValue;
  Color backgroundColor, iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: padding),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRAdiusValue)),
      child: Center(
          child: Icon(
        this.icon,
        size: size,
        color: iconColor,
      )),
    );
  }
}
