import 'package:app/services_provider/core/them/colors.dart';
import 'package:flutter/material.dart';

class customButtomElev extends StatelessWidget {
  customButtomElev(
      {super.key,
      this.backColor,
      this.titleColor,
      this.onPressedFun,
      this.lable = "",
      this.padding});
  final String? lable;
  final Color? backColor;
  final Color? titleColor;
  Function()? onPressedFun;
  double? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            right: this.padding ?? 40.0,
            left: this.padding ?? 40.0,
            top: this.padding ?? 40),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: BorderSide(
                  color: backColor ?? COLOR_THIRD,
                ),
              ),
              backgroundColor: backColor ?? white,
            ),
            child: Text(
              "  $lable  ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: titleColor ?? white,
              ),
            ),
            // onPressed: () {},
            onPressed: onPressedFun ?? () {}));
  }
}
