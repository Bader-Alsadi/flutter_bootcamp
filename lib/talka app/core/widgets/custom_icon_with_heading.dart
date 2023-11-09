import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconContanerWithHeading extends StatelessWidget {
  CustomIconContanerWithHeading(
      {super.key,
      this.hading = "",
      this.svg_color = secondary,
      this.backgroundColor = primary,
      this.borderRAdiusValue = borderRaduis,
      this.svg_path = "assets/svg_image/download-svgrepo-com.svg",
      this.padding = 25});
  double padding, borderRAdiusValue;
  Color backgroundColor, svg_color;
  String? svg_path, hading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: padding * 2,
      width: padding * 2,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRAdiusValue)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: miniSpacer,
            ),
            SvgPicture.asset(
              svg_path!,
              colorFilter: ColorFilter.mode(svg_color, BlendMode.srcIn),
              height: 25,
              width: 25,
            ),
            Text(
              hading!,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
