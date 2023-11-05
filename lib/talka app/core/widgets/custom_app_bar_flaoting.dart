import 'package:app/talka%20app/core/theme/color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomFlotingAppBar extends StatelessWidget {
  CustomFlotingAppBar(
      {super.key, this.flotingWidgetOnAppBar = null, this.height = 55});
  double height;
  Widget? flotingWidgetOnAppBar;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          child: Container(
            height: height,
            color: secondary,
          ),
          clipper: AppBarClipper(),
        ),
        this.flotingWidgetOnAppBar == null
            ? Container()
            : this.flotingWidgetOnAppBar!,
      ],
    );
  }
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // path.lineTo(0, size.height);
    path.moveTo(0, 0);
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
