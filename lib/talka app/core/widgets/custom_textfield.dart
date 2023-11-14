import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/theme/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustmoTextFiled extends StatelessWidget {
  const CustmoTextFiled(
      {super.key,
      required this.isnumber,
      required this.hintText,
      this.backgroundColor});

  final bool isnumber;
  final String? hintText;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: miniSpacer),
      decoration: BoxDecoration(
          color: backgroundColor ?? primary,
          borderRadius: BorderRadius.circular(borderRaduis)),
      child: TextField(
        inputFormatters: [
          isnumber
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.deny("")
        ],
        decoration: InputDecoration(
            hintText: isnumber ? "" : hintText,
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: secondary),
                borderRadius: BorderRadius.circular(borderRaduis))),
      ),
    );
  }
}
