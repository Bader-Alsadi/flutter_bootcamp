import 'package:app/services_provider/core/helper/get_storge_helper.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/core/them/padding.dart';
import 'package:app/services_provider/core/them/text_style.dart';
import 'package:app/services_provider/core/widgets/custom_elevbutton.dart';
import 'package:app/services_provider/core/widgets/custom_image.dart';
import 'package:app/services_provider/featuer/view/notfiction_page/notfiction_page.dart';
import 'package:app/services_provider/featuer/view/order_page/AddOrder.dart';
import 'package:app/services_provider/featuer/view/profile_page/widgets/widget_use.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    super.key,
  });

  static const String ROUTE = "profile_page";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: COLOR_PRIMARY.withOpacity(.8),
              title: Text(
                "الملف الشخصي",
                style: title.copyWith(color: white),
              ),
              centerTitle: true,
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Notfiction_page.ROUTE);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(HE_paddding),
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/svg_image/bell-bing-svgrepo-com.svg",
                          height: 40,
                          colorFilter: ColorFilter.mode(white, BlendMode.srcIn),
                        ),
                        CircleAvatar(
                          radius: 7,
                          backgroundColor: white,
                          child: Text(
                            "1",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
          body: Container(
            decoration:
                BoxDecoration(gradient: LinearGradient(colors: gradientColors)),
            child: ListView(
              children: [
                customImage(
                  iconButton: Icons.edit,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          GetStorageHelper.get_box("user").read("user_name") ??
                              "",
                          style: normalText,
                        ),
                        Visibility(
                          visible: false,
                          child: Text(
                            "سباك",
                            style: normalText.copyWith(
                                color: black.withOpacity(0.5)),
                          ),
                        ),
                        customButtomElev(
                          lable: ' تسجيل كـ صاحب خدمة ',
                          backColor: COLOR_THIRD,
                          onPressedFun: () {
                            Navigator.pushNamed(context, AddOrder.ROUTE);
                          },
                        )
                      ],
                    )),
                SizedBox(
                  height: spaser / 2,
                ),
                CustomHaedValue(
                  head: "رقم الهاتف :  ",
                  value:
                      GetStorageHelper.get_box("user").read("user_phone") ?? "",
                ),
                Visibility(
                  visible: false,
                  child: SizedBox(
                    height: spaser / 2,
                  ),
                ),
                Visibility(
                  visible: false,
                  child: CustomHaedValue(
                    head: "الايميل:  ",
                    value: "baderSaleh@gmaile.com",
                  ),
                ),
                SizedBox(
                  height: spaser / 2,
                ),
                CustomHaedValue(
                  head: "الموقع:  ",
                  value:
                      GetStorageHelper.get_box("user").read("user_locctin") ??
                          "",
                ),
                SizedBox(
                  height: spaser / 2,
                ),
                Visibility(
                  visible: false,
                  child: Custom_about(
                      textValue:
                          "لبخشيستر ءىرىهخسثثتر يبتثهسخبجت يءبرىثهسخرىجشيثتب ثيلتث جيل"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
