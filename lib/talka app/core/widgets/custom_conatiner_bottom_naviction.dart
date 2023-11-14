import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class CustomContainerBottomNaviction extends StatelessWidget {
  CustomContainerBottomNaviction({super.key, this.lable});
  String? lable;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      color: white,
      height: 70,
      padding:
          EdgeInsets.symmetric(vertical: miniSpacer, horizontal: smallSpacer),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(lable ?? "التالي"),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
