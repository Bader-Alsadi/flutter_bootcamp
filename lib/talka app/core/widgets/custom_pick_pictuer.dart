import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_container.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_with_heading.dart';
import 'package:app/talka%20app/core/widgets/custom_show_bottom_sheet.dart';
import 'package:app/talka%20app/core/widgets/custom_title_and_triling.dart';
import 'package:flutter/material.dart';

class CustomPickPictuer extends StatelessWidget {
  CustomPickPictuer({super.key, this.title = "صورة مرفقة", this.option = ""});
  String title, option;
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
                  CustomTitleAndTriling(title: "رفع صورة جديدة"),
                  SizedBox(
                    height: smallSpacer,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomIconContanerWithHeading(
                        padding: 60,
                        hading: "معرض الصور",
                      ),
                      CustomIconContanerWithHeading(
                        padding: 60,
                        hading: "التقاط الصور",
                      )
                    ],
                  )
                ],
              ),
            ));
      },
      child: CustomContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              InkWell(
                onTap: () {},
                child: CustomIconContaner(
                  svg_path: "assets/svg_image/camera-svgrepo-com.svg",
                  backgroundColor: Colors.transparent,
                ),
              ),
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              Text(option,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold))
            ]),
            Divider(),
            CustomIconContaner(
              padding: 50,
            ),
            SizedBox(
              height: miniSpacer,
            )
          ],
        ),
      ),
    );
  }
}
