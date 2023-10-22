import 'package:app/Data/media_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class clipPathEx extends StatefulWidget {
  const clipPathEx({super.key});

  @override
  State<clipPathEx> createState() => _clipPathExState();
}

class _clipPathExState extends State<clipPathEx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: firstClipper(),
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class firstClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 150);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    // path.lineTo(size.width / 2, size.height - 200);
    // path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
