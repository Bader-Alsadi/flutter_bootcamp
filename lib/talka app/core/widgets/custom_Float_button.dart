import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/data/data_technical%20_support.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_genert_list_of_choices.dart';
import 'package:app/talka%20app/core/widgets/custom_show_bottom_sheet.dart';
import 'package:app/talka%20app/core/widgets/custom_title_and_triling.dart';
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
        customShowbutoomSheet(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.9,
              child: CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitleAndTriling(title: "الدعم الفني"),
                    SizedBox(height: miniSpacer),
                    Text("يمكنك التواصل معنا عن طريق احد الطرق التالية"),
                    SizedBox(height: smallSpacer),
                    CustomGenertListOfChocices(
                      height: MediaQuery.sizeOf(context).height * .7,
                      data: technicalSupport,
                    ),
                    SizedBox(height: miniSpacer),
                  ],
                ),
              ),
            ),
            context: context);
      },
      child: Container(
        child: SvgPicture.asset(
          "assets/svg_image/icons/call-calling.svg",
          height: 35,
          colorFilter: ColorFilter.mode(white, BlendMode.srcIn),
        ),
      ),
      backgroundColor: secondary,
    );
  }
}
