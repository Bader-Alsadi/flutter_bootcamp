import 'package:app/talka%20app/core/data/myAddressData.dart';
import 'package:app/talka%20app/core/data/my_settings.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/multi_Coustom_Set_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Mysettings extends StatefulWidget {
  const Mysettings({super.key});

  @override
  State<Mysettings> createState() => _MysettingsPageState();
}

class _MysettingsPageState extends State<Mysettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "الاعدادت",
        ).build(context),
        body: SingleChildScrollView(
          child: Column(
              children: List.generate(
                  mySettingData.length,
                  (index) => customSettingRow(
                        lable: mySettingData[index]["titel"],
                        option: mySettingData[index]["option"],
                      ))),
        ));
  }
}

class customSettingRow extends StatelessWidget {
  customSettingRow({super.key, this.lable = "", this.option = ""});
  String? lable, option;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(lable!,),
            Spacer(),
            Text(option!),
            Icon(
              Icons.arrow_forward_ios_sharp,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
