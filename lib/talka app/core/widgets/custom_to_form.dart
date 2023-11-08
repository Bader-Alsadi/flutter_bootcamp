import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_setting_row.dart';
import 'package:flutter/material.dart';

class CustomTocontainer extends StatelessWidget {
  const CustomTocontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSettingRow(
      svg_path: "assets/svg_image/pin-svgrepo-com.svg",
      title: "الى",
      subTitle: "مكاني",
    );
  }
}