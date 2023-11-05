import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconContaner extends StatelessWidget {
  CustomIconContaner(
      {super.key,
      this.svg_color = secondary,
      this.backgroundColor = primary,
      this.borderRAdiusValue = borderRaduis,
      this.svg_path = "assets/svg_image/download-svgrepo-com.svg",
      this.padding = 25});
  double padding, borderRAdiusValue;
  Color backgroundColor, svg_color;
  String? svg_path;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: padding * 2,
      width: padding * 2,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRAdiusValue)),
      child: Center(
        child: SvgPicture.asset(
          svg_path!,
          colorFilter: ColorFilter.mode(svg_color, BlendMode.srcIn),
          height: 25,
          width: 25,
        ),
        //     child: Icon(
        //   this.icon,
        //   size: size,
        //   color: iconColor,
        // )
      ),
    );
  }
}
