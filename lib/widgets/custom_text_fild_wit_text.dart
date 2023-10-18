import 'package:app/theme/colors.dart';
import 'package:app/theme/padding.dart';
import 'package:flutter/material.dart';

class customTextFildwithtext extends StatelessWidget {
  customTextFildwithtext(
      {super.key,
      this.regExp,
      this.labelFild = "",
      this.borderColor = white,
      this.borderWidth = 1,
      this.hinText,
      required this.suffixIcon,
      this.suffixIconColor,
      this.ispassword = false});

  String? regExp;
  Color borderColor;
  double borderWidth;
  String labelFild;
  String? hinText;
  String suffixIcon;
  Color? suffixIconColor;
  bool ispassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: ispassword,
      // inputFormatters: [
      //   FilteringTextInputFormatter.allow(RegExp("r[$regExp]"))
      // ],
      validator: (value) {
        if (RegExp('r$regExp').hasMatch(value!))
          return null;
        else {
          if (value.isEmpty)
            return "fill this";
          else
            null;
        }
        return null;
      },
      style: TextStyle(color: borderColor),
      decoration: InputDecoration(
          suffixIcon: Text(
            suffixIcon,
            textAlign: TextAlign.right,
            style: TextStyle(color: borderColor),
          ),
          suffixIconColor:
              suffixIconColor == null ? borderColor : suffixIconColor,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          )),
          label: Text(
            labelFild,
            style: TextStyle(color: white),
          ),
          contentPadding: EdgeInsets.only(top: spacer),
          hintText: hinText,
          hintStyle: TextStyle(color: white, fontSize: 20)),
    );
  }
}
