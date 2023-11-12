import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHeading extends StatelessWidget {
  CustomHeading(
      {super.key,
      this.heading = "لا يوجد نص",
      this.svg_path = null,
      this.triling = null});
  String heading;
  String? svg_path;
  Widget? triling;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        svg_path == null
            ? CustomIconContaner(
                backgroundColor: Colors.transparent,
                svg_path: "assets/svg_image/pin-minus-svgrepo-com.svg",
                padding: 15,
              )
            : CustomIconContaner(
                svg_color: secondary,
                svg_path: svg_path!,
                backgroundColor: Colors.transparent,
              ),
        Text(
          heading,
        ),
        Spacer(),
        triling == null ? Container() : triling!
      ],
    );
  }
}
