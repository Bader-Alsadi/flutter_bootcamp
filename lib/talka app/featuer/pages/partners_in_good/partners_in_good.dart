import 'package:app/talka%20app/core/widgets/custom_Float_button.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar_flaoting.dart';
import 'package:app/talka%20app/core/widgets/custom_conatiner_bottom_naviction.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_delivry_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_from_container.dart';
import 'package:app/talka%20app/core/widgets/custom_note.dart';
import 'package:app/talka%20app/core/widgets/custom_to_form.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_setting_row.dart';
import 'package:flutter/material.dart';

class PartenersInGood extends StatefulWidget {
  const PartenersInGood({super.key});

  @override
  State<PartenersInGood> createState() => _PartenersInGoodState();
}

class _PartenersInGoodState extends State<PartenersInGood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "شركاء في خير ",
      ).build(context),
      floatingActionButton: customFlotingButton(),
      bottomNavigationBar: CustomContainerBottomNaviction(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomFlotingAppBar(
              height: 100,
              flotingWidgetOnAppBar: CustomContainer(
                child: Column(
                  children: [
                    CustomFromContainer(),
                    Divider(),
                    CustomTocontainer(),
                  ],
                ),
              ),
            ),
            CustomContainer(
              child: CustomSettingRow(
                title: "نوع التبرع ",
                subTitle: "يرجى تحديد نوع التبرع ",
                svg_path: "assets/svg_image/bag-svgrepo-com.svg",
              ),
            ),
            CustomDelivryContanier(),
            CustomNotes()
          ],
        ),
      ),
    );
  }
}
