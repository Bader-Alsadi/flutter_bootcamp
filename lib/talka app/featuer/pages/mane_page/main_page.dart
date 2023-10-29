import 'package:app/movie_app/core/widgets/coustom_abb_bar.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.sizeOf(context).height / 4,
            pinned: true,
            title: Text("الرئسية"),
            flexibleSpace: ClipPath(
                clipper: AppBarClipper(),
                child: Container(
                  height: MediaQuery.sizeOf(context).height / 4,
                )),
          ),
          SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                    height: 200,
                    color: white,
                    child: Text("asdf"),
                  ))
        ],
      ),
    );
  }
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(0, size.height, size.width / 2, size.height / 2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
