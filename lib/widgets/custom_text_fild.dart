import 'package:app/theme/colors.dart';
import 'package:app/theme/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class customTextFild extends StatelessWidget {
  customTextFild(
      {super.key,
      this.controller,
      this.regExp,
      this.labelFild = "",
      this.borderColor = white,
      this.borderWidth = 1,
      this.hinText,
      this.suffixIcon,
      this.suffixIconColor,
      this.ispassword = false});
  TextEditingController? controller;
  String? regExp;
  Color borderColor;
  double borderWidth;
  String labelFild;
  String? hinText;
  IconData? suffixIcon;
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
      },
      style: TextStyle(color: borderColor),
      decoration: InputDecoration(
          suffixIcon: Icon(suffixIcon),
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
