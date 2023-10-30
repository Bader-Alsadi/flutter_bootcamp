import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_container.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_Title_and_SubTitle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCounterFloting extends StatelessWidget {
  const CustomCounterFloting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: smallSpacer, horizontal: miniSpacer),
      height: MediaQuery.sizeOf(context).height / 10,
      padding: EdgeInsets.all(miniSpacer),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          CustomIconContaner(
            icon: FontAwesomeIcons.clock,
          ),
          SizedBox(
            width: miniSpacer,
          ),
          customTitleAndSubtitle(
            title: "0",
            subTitle: "طلباتي الحالية",
          ),
          Spacer(),
          CustomIconContaner(
            icon: Icons.list_alt_outlined,
          ),
          SizedBox(
            width: miniSpacer,
          ),
          customTitleAndSubtitle(
            title: "0",
            subTitle: "احمالي طلباتي",
          )
        ],
      ),
    );
  }
}
