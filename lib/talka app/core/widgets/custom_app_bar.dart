
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_container.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    super.key,
    this.title = "",
  });
  String title;
  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Container(
        color: secondary,
        child: SizedBox(
          height: 100,
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            children: [
              Positioned(
                top: 40,
                right: 25,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CustomIconContaner(
                    svg_color: white,
                    backgroundColor: white.withOpacity(0.3),
                    svg_path: "assets/svg_image/right-svgrepo-com.svg",
                    padding: 20,
                  ),
                ),
              ),
              Center(
                  child: Text(
                "\n $title ",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: white, fontSize: 20),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
