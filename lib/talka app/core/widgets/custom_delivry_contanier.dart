import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/data/delviry_mathod.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_generte_list_radio.dart';
import 'package:app/talka%20app/core/widgets/custom_show_bottom_sheet.dart';
import 'package:app/talka%20app/core/widgets/custom_title_and_triling.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_setting_row.dart';
import 'package:flutter/material.dart';

class CustomDelivryContanier extends StatelessWidget {
  const CustomDelivryContanier({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        customShowbutoomSheet(
            context: context,
            child: CustomContainer(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTitleAndTriling(title: "وسيلة التوصيل"),
                  SizedBox(
                    height: smallSpacer,
                  ),
                  CustomGenertListRadio(
                    data: delivryMathod,
                  )
                ],
              ),
            ));
      },
      child: CustomContainer(
        child: CustomSettingRow(
          title: "وسيلة التوصيل ",
          subTitle: "دراجة",
          svg_path: "",
        ),
      ),
    );
  }
}
