import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:flutter/material.dart';

class CutstomImageWithRaduis extends StatelessWidget {
  CutstomImageWithRaduis(
      {super.key,
      this.height = 80,
      this.width = 70,
      this.borderRAdiusValue = borderRaduis,
      this.source = "assets/image/4.jpg"});
  double height, width, borderRAdiusValue;
  String source;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRAdiusValue),
      child: Image.asset(
        source,
        height: height,
        width: width,
        fit: BoxFit.fill,
      ),
    );
  }
}
