
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_setting_row.dart';
import 'package:flutter/material.dart';

class CustomDelvieryMathod extends StatelessWidget {
  const CustomDelvieryMathod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: CustomSettingRow(
        svg_path: "assets/svg_image/pin-svgrepo-com.svg",
        title: "وسيلة التوصيل ",
        subTitle: "درجة",
      ),
    );
  }
}


