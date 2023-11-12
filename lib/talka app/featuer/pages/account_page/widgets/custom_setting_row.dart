import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:app/talka%20app/core/theme/padding.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_container.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_Title_and_SubTitle.dart';
import 'package:flutter/material.dart';

class CustomSettingRow extends StatelessWidget {
  CustomSettingRow(
      {super.key, this.title = "", this.subTitle = "", this.svg_path = null});
  String? title, subTitle, svg_path;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        children: [
          CustomIconContaner(
            svg_color: Colors.grey,
            svg_path: svg_path,
            padding: 22,
          ),
          SizedBox(
            width: miniSpacer,
          ),
          customTitleAndSubtitle(
            subTitle: subTitle!,
            title: title!,
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
