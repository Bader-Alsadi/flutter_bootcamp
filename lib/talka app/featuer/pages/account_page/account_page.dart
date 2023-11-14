import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/data/setting_data.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar_flaoting.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_container.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_count_floating.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_head_in_setting.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/multi_Coustom_Set_row.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            height: 80,
            padding: EdgeInsets.all(miniSpacer),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/talak_images/app_bar_cuter.jpg"),
                    fit: BoxFit.cover)),
            child: Row(children: [
              CustomIconContaner(
                svg_path: "assets/svg_image/icons/app-logo.svg",
                backgroundColor: white,
                padding: 30,
                svg_color: Colors.grey,
              ),
              SizedBox(
                width: miniSpacer,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "بدر",
                    style: TextStyle(color: white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "0997774541450",
                    style: TextStyle(color: white, fontWeight: FontWeight.bold),
                  ),
                ],
              )
    
            ]),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFlotingAppBar(
                height: MediaQuery.sizeOf(context).height / 7,
                flotingWidgetOnAppBar: CustomCounterFloting(),
              ),
              customHeadInSettings(
                head: "عن المستخدم",
              ),
              multiCustomSettingRwo(
                data: settingsData.sublist(0, 3),
              ),
              customHeadInSettings(
                head: "اخرى",
              ),
              multiCustomSettingRwo(
                data: settingsData.sublist(3),
              )
            ],
          ),
        ),
      ),
    );
  }
}
