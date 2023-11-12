import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_container.dart';
import 'package:flutter/material.dart';

class customAppBar2 extends StatelessWidget {
  customAppBar2({
    required this.title,
    super.key,
  });
  late String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // height: ,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/talak_images/app_bar_cuter.jpg"),
              fit: BoxFit.cover)),
      child: Container(
        margin:
            const EdgeInsets.all(miniSpacer * 2).copyWith(top: 40, bottom: 0),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: white, fontSize: 20),
            ),
            Spacer(),
            CustomIconContaner(
              svg_color: white,
              backgroundColor: white.withOpacity(0.2),
              svg_path: "assets/svg_image/icons/trash.svg",
              padding: 25,
            )
          ],
        ),
      ),
    );
  }
}
