import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class customFlotingButton extends StatelessWidget {
  const customFlotingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            // backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
            context: context,
            builder: (context) {
              return CustomContainer(
                child: Column(
                  children: [],
                ),
              );
            });
      },
      child: Container(
        child: SvgPicture.asset(
          "assets/svg_image/phone-calling-svgrepo-com.svg",
          colorFilter: ColorFilter.mode(white, BlendMode.srcIn),
        ),
      ),
      backgroundColor: secondary,
    );
  }
}
