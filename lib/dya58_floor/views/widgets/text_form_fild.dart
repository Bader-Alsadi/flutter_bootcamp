import 'package:app/dya58_floor/theme/text_style.dart';
import 'package:app/dya58_floor/theme/them_app.dart';
import 'package:flutter/material.dart';

class TextFileCustom extends StatelessWidget {
  TextFileCustom(
      {super.key, this.lable = " ", this.hint = " ", this.controller = null});
  String lable, hint;
  TextEditingController? controller;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable,
          style: subTitle,
        ),
        SizedBox(
          height: minPadding,
        ),
        Container(
            height: 50,
            padding: EdgeInsets.all(minPadding),
            decoration: BoxDecoration(
              border: Border.all(
                color: primary,
              ),
              borderRadius: BorderRadius.circular(radio),
            ),
            child: TextFormField(
              controller: controller,
              autocorrect: true,
              cursorColor: primary,
              cursorHeight: 20,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: hintText,
                border: InputBorder.none,
              ),
            )),
      ],
    );
  }
}
