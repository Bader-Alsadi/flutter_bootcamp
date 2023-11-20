import 'package:app/dya58_floor/theme/text_style.dart';
import 'package:app/dya58_floor/theme/them_app.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/data/rote_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.list,
          color: white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/svg_image/bell-bing-svgrepo-com.svg",
              height: 30,
              colorFilter: ColorFilter.mode(white, BlendMode.srcIn),
            ),
          )
        ],
        backgroundColor: secondry,
        title: Text(
          "Dashborad",
          style: TextStyle(color: white),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  ClipPath(
                    clipper: DashboardClipper(),
                    child: Container(
                      color: secondry,
                      height: MediaQuery.sizeOf(context).height * .4,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: miniSpacer),
                    height: MediaQuery.sizeOf(context).height * .3,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 50,
                          color: black.withOpacity(0.4),
                          // spreadRadius: 3,
                        ),
                      ],
                      color: white,
                      borderRadius: BorderRadius.circular(radio),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage("assets/image/index.jpeg"),
                          ),
                          SizedBox(
                            height: minPadding,
                          ),
                          Text(
                            "Bader alsadi",
                            style: subTitle,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: miniSpacer),
                height: MediaQuery.sizeOf(context).height * .2,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 40,
                      color: black.withOpacity(0.3),
                      // spreadRadius: 3,
                    ),
                  ],
                  color: white,
                  borderRadius: BorderRadius.circular(radio),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DashboardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height * .8, size.width, size.height / 2);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
