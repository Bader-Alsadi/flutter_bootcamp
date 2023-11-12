import 'package:app/talka%20app/core/theme/padding.dart';
import 'package:app/talka%20app/core/widgets/custom_icon.dart';
import 'package:app/talka%20app/core/widgets/custom_text_gray.dart';
import 'package:flutter/material.dart';

class CustomFlotingContainer extends StatelessWidget {
  CustomFlotingContainer({super.key, this.imageWidget});
  Widget? imageWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        imageWidget == null ? Text("data") : imageWidget!,
        SizedBox(
          width: miniSpacer,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.66,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "مطعم حضرموت",
                // style: TextStyle(fontSize: 10),
              ),
              SizedBox(
                height: 5,
              ),
              CustomText(text: "شارع شبام"),
              SizedBox(
                height: 5,
              ),
              Row(children: [
                CustomIcon(
                  icon: Icons.star,
                  colorIcon: Colors.amber,
                ),
                CustomText(
                  text: " 3.3 (3) ",
                ),
                CustomIcon(
                  icon: Icons.circle_rounded,
                  size: 8,
                ),
                CustomIcon(
                  icon: Icons.location_on_outlined,
                ),
                CustomText(
                  text: " 0.0 كيلو ",
                ),
                CustomIcon(
                  icon: Icons.circle_rounded,
                  size: 8,
                ),
                CustomIcon(
                  icon: Icons.lock_clock,
                ),
                CustomText(
                  text: " 60-40 دقيقة",
                ),
              ])
            ],
          ),
        )
      ],
    );
  }
}
