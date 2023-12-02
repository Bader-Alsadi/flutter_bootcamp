import 'package:app/services_provider/core/helper/ui_helper.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:flutter/material.dart';

class customImage extends StatelessWidget {
  customImage({super.key, this.image_path, this.onPressedFun, this.iconButton});

  String? image_path;
  IconData? iconButton;
  void Function()? onPressedFun;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 32, right: 8, bottom: 8),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          SizedBox(
            height: 130,
            width: 130,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(65),
              child: Image.asset(
                image_path ?? 'assets/placeholder.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 110,
            child: FloatingActionButton(
                backgroundColor: COLOR_THIRD,
                child: Icon(
                  iconButton ?? Icons.camera_alt,
                  color: isDarkMode(context) ? Colors.black : Colors.white,
                ),
                mini: true,
                onPressed: this.onPressedFun ?? () {}
                // _onCameraClick(context),
                ),
          )
        ],
      ),
    );
  }
}
