import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_container.dart';
import 'package:flutter/material.dart';

class CustomTrlingWidgets extends StatelessWidget {
  const CustomTrlingWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: primary, borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          CustomIconContaner(
            backgroundColor: Colors.transparent,
            svg_path: "assets/svg_image/clock-seven-thirty-svgrepo-com.svg",
            padding: 15,
          ),
          Text("أضافة المزيد")
        ],
      ),
    );
  }
}
