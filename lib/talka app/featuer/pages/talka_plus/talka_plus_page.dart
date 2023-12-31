import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/data/data_carry_type.dart';
import 'package:app/talka%20app/core/widgets/custom_Float_button.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar_flaoting.dart';
import 'package:app/talka%20app/core/widgets/custom_conatiner_bottom_naviction.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_delivry_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_from_container.dart';
import 'package:app/talka%20app/core/widgets/custom_generte_list_radio.dart';
import 'package:app/talka%20app/core/widgets/custom_note.dart';
import 'package:app/talka%20app/core/widgets/custom_pick_pictuer.dart';
import 'package:app/talka%20app/core/widgets/custom_show_bottom_sheet.dart';
import 'package:app/talka%20app/core/widgets/custom_title_and_triling.dart';
import 'package:app/talka%20app/core/widgets/custom_to_form.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_setting_row.dart';
import 'package:flutter/material.dart';

class TalkaPlusPage extends StatefulWidget {
  const TalkaPlusPage({super.key});

  @override
  State<TalkaPlusPage> createState() => _TalkaPlusPageState();
}

class _TalkaPlusPageState extends State<TalkaPlusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: customFlotingButton(),
        bottomNavigationBar: CustomContainerBottomNaviction(),
        appBar: CustomAppBar(title: "طلقة بلس").build(context),
        body: Padding(
            padding: const EdgeInsets.only(bottom: smallSpacer),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomFlotingAppBar(
                    height: 100,
                    flotingWidgetOnAppBar: CustomContainer(
                      child: Column(
                        children: [
                          CustomFromContainer(),
                          Divider(
                            thickness: 2,
                          ),
                          CustomTocontainer(),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      customShowbutoomSheet(
                          context: context,
                          child: CustomContainer(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomTitleAndTriling(title: "نوع المنقولات"),
                                SizedBox(
                                  height: smallSpacer,
                                ),
                                CustomGenertListRadio(
                                  data: carriesTypes,
                                )
                              ],
                            ),
                          ));
                    },
                    child: CustomContainer(
                      child: CustomSettingRow(
                        svg_path: "assets/svg_image/pin-svgrepo-com.svg",
                        title: "نوع المنقولات",
                        subTitle: "كسر",
                      ),
                    ),
                  ),
                  CustomDelivryContanier(),
                  CustomNotes(),
                  CustomPickPictuer(
                    option: "(اختياري)",
                  )
                ],
              ),
            )));
  }
}
