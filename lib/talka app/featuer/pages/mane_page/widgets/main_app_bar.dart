import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    super.key,
    required double scrollPosition,
  }) : _scrollPosition = scrollPosition;

  final double _scrollPosition;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: ,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/talak_images/app_bar_cuter.jpg"),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          Positioned(
              left: 25,
              top: 15,
              child: CustomIconContaner(
                svg_color: white,
                backgroundColor: white.withOpacity(0.2),
                svg_path: "assets/svg_image/bell-bing-svgrepo-com.svg",
                padding: 25,
              )),
          AnimatedOpacity(
              opacity: _scrollPosition == 0 ? 0 : 1,
              duration: Duration(milliseconds: 500),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "     الرئيسية",
                    style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: white,
                        fontSize: 15),
                  ))),
          AnimatedOpacity(
            opacity: _scrollPosition == 0 ? 1 : 0,
            duration: Duration(milliseconds: 500),
            child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "    اهلا و سهلا بدر  ",
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                color: white,
                                fontSize: 15,
                                fontFamily: "Montserrat"),
                          ),
                          SvgPicture.asset(
                              "assets/svg_image/icons/5-on-review.svg"),
                        ],
                      ),
                      Text(
                        "    التوصيل الى :",
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: white,
                            fontSize: 15,
                            fontFamily: "Montserrat"),
                      ),
                    ])),
          ),
        ],
      ),
    );
  }
}
