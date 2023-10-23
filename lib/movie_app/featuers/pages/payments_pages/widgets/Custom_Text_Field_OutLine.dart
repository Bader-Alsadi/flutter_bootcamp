import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class CustomTextFieldOutLine extends StatelessWidget {
  CustomTextFieldOutLine({
    this.width = 100,
    super.key,
  });
  double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(miniSpacer - 5),
      decoration: BoxDecoration(
        border: Border.all(color: white.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: width,
        child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none)),
      ),
    );
  }
}
