import 'package:app/talka%20app/core/data/myAddressData.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar.dart';
import 'package:app/talka%20app/core/widgets/custom_conatiner_bottom_naviction.dart';
import 'package:app/talka%20app/featuer/pages/account_page/widgets/multi_Coustom_Set_row.dart';
import 'package:flutter/material.dart';

class MyAddressPage extends StatefulWidget {
  const MyAddressPage({super.key});

  @override
  State<MyAddressPage> createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "العناوين",
        ).build(context),
        bottomNavigationBar: CustomContainerBottomNaviction(
          lable: "اضف عنوان جديد",
        ),
        body: SingleChildScrollView(
          child: multiCustomSettingRwo(
            data: myAddresses,
          ),
        ));
  }
}
