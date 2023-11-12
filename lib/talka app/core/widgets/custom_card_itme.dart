import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/theme/padding.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_container.dart';
import 'package:app/talka%20app/core/widgets/custom_image_raduis.dart';
import 'package:app/talka%20app/core/widgets/custom_text_gray.dart';
import 'package:flutter/material.dart';

class CustomCardItem extends StatelessWidget {
  const CustomCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CutstomImageWithRaduis(
              height: 50,
              width: 45,
            ),
            Positioned(
              bottom: 48,
              left: 41,
              child: Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(
          width: miniSpacer,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("قشري بلخم"),
            CustomText(
              text: "الحجم الاساسي",
            ),
            Row(
              children: [
                CustomText(
                  text: "1200 ري",
                ),
                SizedBox(
                  width: spacer * 2,
                ),
                Row(
                  children: [
                    CustomIconContaner(
                      svg_path: "assets/svg_image/add-svgrepo-com.svg",
                      svg_color: white,
                      borderRAdiusValue: 10,
                      padding: 15,
                      backgroundColor: orange,
                    ),
                    Text("     2     "),
                    CustomIconContaner(
                      svg_path: "assets/svg_image/remove-svgrepo-com.svg",
                      svg_color: orange,
                      borderRAdiusValue: 10,
                      padding: 15,
                      backgroundColor: orange.withOpacity(0.2),
                    )
                  ],
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
