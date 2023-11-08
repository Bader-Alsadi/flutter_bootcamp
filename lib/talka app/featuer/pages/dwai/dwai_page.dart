import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/theme/padding.dart';
import 'package:app/talka%20app/core/widgets/custom_Float_button.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar_flaoting.dart';
import 'package:app/talka%20app/core/widgets/custom_conatiner_bottom_naviction.dart';
import 'package:app/talka%20app/core/widgets/custom_container_with_textfiled.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_from_container.dart';
import 'package:app/talka%20app/core/widgets/custom_note.dart';
import 'package:app/talka%20app/core/widgets/custom_pick_pictuer.dart';
import 'package:flutter/material.dart';

class DwaiPage extends StatefulWidget {
  const DwaiPage({super.key});

  @override
  State<DwaiPage> createState() => _Dwai_pageState();
}

class _Dwai_pageState extends State<DwaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: customFlotingButton(),
        bottomNavigationBar: CustomContainerBottomNaviction(),
        appBar: CustomAppBar(title: "دوائي").build(context),
        body: Padding(
            padding: const EdgeInsets.only(bottom: smallSpacer),
            child: SingleChildScrollView(
                  child: Column(children: [
                CustomFlotingAppBar(
                  height: 100,
                  flotingWidgetOnAppBar: CustomContainer(
                    child: Column(
                      children: [
                        CustomFromContainer(),
                      ],
                    ),
                  ),
                ),
                CustomContainerWithTextFiled(
                  title: "أسم دواء",
                  hintText: "يرجى كتابة اسم الدواء",
                ),
                CustomPickPictuer(
                  title: "صور العلاج او الروشتة",
                ),
                CustomContainerWithTextFiled(
                  svg_path: "assets/svg_image/up-circle-svgrepo-com.svg",
                  isnumber: true,
                  title: "العدد المطلوب ",
                ),
                CustomNotes()
              ]))
            ));
  }
}
