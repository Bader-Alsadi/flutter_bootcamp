 import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/movie_app/featuers/pages/payments_pages/widgets/Custom_Text_Field_OutLine.dart';
import 'package:flutter/material.dart';

Column coustomSmallTextFiled(BuildContext context,
      {required String headText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: smallSpacer,
        ),
        Text(
          headText,
          style: TextStyle(color: white),
        ),
        SizedBox(
          height: miniSpacer,
        ),
        CustomTextFieldOutLine(
          width: MediaQuery.sizeOf(context).width / 3,
        ),
      ],
    );
  }