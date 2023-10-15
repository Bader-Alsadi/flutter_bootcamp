import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';

class customElevatedButton extends StatelessWidget {
  customElevatedButton(
      {super.key,
      this.TextValue = "pass",
      this.backgroundColor = yellow,
      this.height = 50,
      this.width,
      this.navigator = null,
      this.textColor});
  String? TextValue;
  Color? textColor;
  Color? backgroundColor;
  double? width;
  double? height;
  String? navigator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width == null ? MediaQuery.of(context).size.width : width,
      child: ElevatedButton(
        onPressed: navigator == null
            ? () {}
            : () {
                Navigator.pushNamed(context, navigator!);
              },
        child: Text(
          TextValue!.toUpperCase(),
          style: TextStyle(color: textColor == null ? white : textColor!),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}
