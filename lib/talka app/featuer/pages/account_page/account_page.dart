import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar_flaoting.dart';
import 'package:app/talka%20app/core/widgets/custom_icon_container.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_Title_and_SubTitle.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_count_floating.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/custom_setting_row.dart';
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(89),
        child: Container(
          color: secondary,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFlotingAppBar(
              flotingWidgetOnAppBar: CustomCounterFloting(),
            ),
            Text("عن المستخدم"),
            multiCustomSettingRwo(
              
              numberOfRow: 3,
            ),
            Text("اخرى"),
            multiCustomSettingRwo(
              numberOfRow: 4,
            )
          ],
        ),
      ),
    );
  }
}