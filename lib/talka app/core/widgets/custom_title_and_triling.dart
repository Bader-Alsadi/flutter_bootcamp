import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTitleAndTriling extends StatelessWidget {
  CustomTitleAndTriling({super.key, required this.title, this.svg_path = null});
  String? title, svg_path;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(svg_path == null
              ? "assets/svg_image/left-svgrepo-com (1).svg"
              : svg_path!),
        )
      ],
    );
  }
}
