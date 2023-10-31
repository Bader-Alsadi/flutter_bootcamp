
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon({
    super.key,
    this.icon = Icons.abc,
    this.colorIcon = Colors.grey,
    this.size = 20,
  });
  IconData icon;
  Color colorIcon;
  double size;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: colorIcon,
      size: size,
    );
  }
}
