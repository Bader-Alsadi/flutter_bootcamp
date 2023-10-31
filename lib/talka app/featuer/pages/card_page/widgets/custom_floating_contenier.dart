
import 'package:app/talka%20app/core/theme/padding.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_icon.dart';
import 'package:app/talka%20app/core/widgets/custom_image_raduis.dart';
import 'package:app/talka%20app/core/widgets/custom_text_gray.dart';
import 'package:flutter/material.dart';

class CustomFlotingContainer extends StatelessWidget {
  const CustomFlotingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CutstomImageWithRaduis(),
          SizedBox(
            width: miniSpacer,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("dsvkdsfgjnvds;klfnvfsdkjlfN:Vdskv"),
              SizedBox(
                height: 5,
              ),
              CustomText(text: "dsvkdsfgjnvds;klfnvfsdkjlfN:Vdskv"),
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
          )
        ],
      ),
    );
  }
}
