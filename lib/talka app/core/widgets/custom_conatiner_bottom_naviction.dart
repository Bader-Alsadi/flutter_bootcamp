import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/theme/padding.dart';
import 'package:flutter/material.dart';

class CustomContainerBottomNaviction extends StatelessWidget {
  const CustomContainerBottomNaviction({
    super.key,
  });

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
        child: Text("التالي"),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
