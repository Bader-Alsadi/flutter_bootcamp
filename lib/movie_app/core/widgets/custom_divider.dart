import 'package:app/movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  CustomDivider({
    this.colorDivder = divider,
    this.thickness = 12,
    super.key,
  });
  double thickness;
  Color colorDivder;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      color: colorDivder,
    );
  }
}
