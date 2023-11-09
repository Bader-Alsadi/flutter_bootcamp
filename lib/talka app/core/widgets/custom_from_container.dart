import 'package:app/talka%20app/core/widgets/custom_pick_address.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_setting_row.dart';
import 'package:flutter/material.dart';

class CustomFromContainer extends StatelessWidget {
  const CustomFromContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        customPickaddress(context);
      },
      child: CustomSettingRow(
        svg_path: "assets/svg_image/pin-svgrepo-com.svg",
        title: "من",
        subTitle: "_______",
      ),
    );
  }
}
