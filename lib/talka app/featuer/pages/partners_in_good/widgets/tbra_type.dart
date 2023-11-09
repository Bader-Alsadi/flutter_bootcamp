import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/data/data_tbara_type.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_generte_list_radio.dart';
import 'package:app/talka%20app/core/widgets/custom_show_bottom_sheet.dart';
import 'package:app/talka%20app/core/widgets/custom_title_and_triling.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_setting_row.dart';
import 'package:flutter/material.dart';

class CustomTbraType extends StatelessWidget {
  const CustomTbraType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: InkWell(
        onTap: () => customShowbutoomSheet(
            context: context,
            child: CustomContainer(
              child: Column(
                children: [
                  CustomTitleAndTriling(title: "نوع التبرع"),
                  SizedBox(
                    height: smallSpacer,
                  ),
                  CustomGenertListRadio(
                    data: tbraType,
                  )
                ],
              ),
            )),
        child: CustomSettingRow(
          title: "نوع التبرع ",
          subTitle: "يرجى تحديد نوع التبرع ",
          svg_path: "assets/svg_image/bag-svgrepo-com.svg",
        ),
      ),
    );
  }
}

