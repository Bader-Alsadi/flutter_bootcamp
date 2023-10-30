import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:app/talka%20app/core/theme/padding.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_container.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_Title_and_SubTitle.dart';
import 'package:flutter/material.dart';

class CustomSettingRow extends StatelessWidget {
  CustomSettingRow({super.key, this.title = "", this.subTitle = ""});
  late String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(miniSpacer),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(borderRaduis),
      ),
      child: Row(
        children: [
          CustomIconContaner(
            icon: Icons.edit,
          ),
          SizedBox(
            width: miniSpacer,
          ),
          customTitleAndSubtitle(
            subTitle: subTitle,
            title: title,
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
