import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomContainerWithTextFiled extends StatelessWidget {
  CustomContainerWithTextFiled(
      {super.key,
      this.title = "اختر عنوان",
      this.hintText = "ادخل شي ما",
      this.isnumber = false,
      this.svg_path = null});
  String? title, hintText, svg_path;
  bool isnumber;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(children: [
        CustomHeading(
          heading: title!,
          svg_path: svg_path == null
              ? "assets/svg_image/note-text-svgrepo-com.svg"
              : svg_path,
        ),
        Divider(),
        Container(
          height: 60,
          margin: EdgeInsets.symmetric(vertical: miniSpacer),
          decoration: BoxDecoration(
              color: primary,
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
        )
      ]),
    );
  }
}
