
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
              height: 60,
              width: 55,
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
            Text("يسبشثصب سيبشثقل سيبشصث سبصشب"),
            CustomText(
              text: "يسبشثصب سيبشثقل سيبشصث سبصشب",
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
                      borderRAdiusValue: 10,
                      icon: Icons.add,
                      height: 30,
                      iconColor: white,
                      size: 15,
                      padding: 11,
                      backgroundColor: orange,
                    ),
                    Text("     2     "),
                    CustomIconContaner(
                      borderRAdiusValue: 10,
                      icon: Icons.remove,
                      height: 30,
                      iconColor: orange,
                      size: 15,
                      padding: 11,
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