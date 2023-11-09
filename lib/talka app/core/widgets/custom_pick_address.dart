import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/theme/padding.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_radio_tile.dart';
import 'package:app/talka%20app/core/widgets/custom_show_bottom_sheet.dart';
import 'package:app/talka%20app/core/widgets/custom_title_and_triling.dart';
import 'package:flutter/material.dart';

Future<dynamic> customPickaddress(BuildContext context) {
  return customShowbutoomSheet(
      context: context,
      child: CustomContainer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTitleAndTriling(
              title: "اختر عنوان التوصيل ",
            ),
            SizedBox(
              height: smallSpacer,
            ),
            customRadioTile(
              groupValue: 1,
              value: 1,
            ),
            SizedBox(
              height: miniSpacer,
            ),
            customRadioTile(
              groupValue: 1,
              value: 2,
            ),
            SizedBox(
              height: smallSpacer,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {},
                child: Text("التالي"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ],
        ),
      ));
}
