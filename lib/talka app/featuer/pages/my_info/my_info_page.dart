import 'package:app/talka%20app/core/theme/borderRAdius.dart';
import 'package:app/talka%20app/core/theme/color.dart';
import 'package:app/talka%20app/core/theme/padding.dart';
import 'package:app/talka%20app/core/widgets/customTextAndOption.dart';
import 'package:app/talka%20app/core/widgets/custom_app_bar.dart';
import 'package:app/talka%20app/core/widgets/custom_conatiner_bottom_naviction.dart';
import 'package:app/talka%20app/core/widgets/custom_contanier.dart';
import 'package:app/talka%20app/core/widgets/custom_textfield.dart';
import 'package:app/talka%20app/featuer/pages/my_info/widgets/radioTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyInfoPage extends StatefulWidget {
  const MyInfoPage({super.key});

  @override
  State<MyInfoPage> createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "بيانتي").build(context),
      bottomNavigationBar: CustomContainerBottomNaviction(
        lable: "حفظ التعديلات",
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * .7,
          child: CustomContainer(
            backgroundColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomRight,
                  children: [
                    SvgPicture.asset(
                      "assets/svg_image/icons/user-photo-empty-profile.svg",
                      height: 80,
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: orange,
                      child: SvgPicture.asset(
                        "assets/svg_image/icons/edit.svg",
                        colorFilter: ColorFilter.mode(white, BlendMode.srcIn),
                      ),
                    )
                  ],
                ),
                customTextAndOptionText(
                  head: "اسم المستخدم",
                  option: "",
                ),
                CustmoTextFiled(
                  isnumber: false,
                  hintText: "",
                  backgroundColor: white,
                ),
                customTextAndOptionText(
                  head: "البريد الاكتروني",
                ),
                CustmoTextFiled(
                  isnumber: false,
                  hintText: "",
                  backgroundColor: white,
                ),
                customTextAndOptionText(
                  head: "تاريخ الميلاد",
                ),
                CustmoTextFiled(
                  isnumber: false,
                  hintText: "",
                  backgroundColor: white,
                ),
                customTextAndOptionText(
                  head: "الحنس ",
                  option: "",
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomRadioTile(
                        lable: "ذكر",
                      ),
                    ),
                    SizedBox(
                      width: smallSpacer / 2,
                    ),
                    Expanded(
                      child: CustomRadioTile(
                        lable: "انثى",
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
