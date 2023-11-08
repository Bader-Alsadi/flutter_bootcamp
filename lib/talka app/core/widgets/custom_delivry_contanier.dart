import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_setting_row.dart';
import 'package:flutter/material.dart';

class CustomDelivryContanier extends StatelessWidget {
  const CustomDelivryContanier({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: CustomSettingRow(
        title: "وسيلة التوصيل ",
        subTitle: "دراجة",
        svg_path: "",
      ),
    );
  }
}
