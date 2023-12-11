import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/services_provider/core/helper/db_helper.dart';
import 'package:app/services_provider/core/helper/get_storge_helper.dart';
import 'package:app/services_provider/core/helper/ui_helper.dart';
import 'package:app/services_provider/core/local_database/entities/user_entity.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/core/them/padding.dart';
import 'package:app/services_provider/core/them/text_style.dart';
import 'package:app/services_provider/core/widgets/custom_elevbutton.dart';
import 'package:app/services_provider/core/widgets/custom_filed.dart';
import 'package:app/services_provider/core/widgets/custom_heda.dart';
import 'package:app/services_provider/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class PresonalInfomation extends StatefulWidget {
  PresonalInfomation({
    super.key,
  });

  static const String ROUTE = "presonal_information";

  @override
  State<PresonalInfomation> createState() => _PresonalInfomationState();
}

class _PresonalInfomationState extends State<PresonalInfomation> {
  final GlobalKey<FormState> FormKey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();
  AutovalidateMode _validate = AutovalidateMode.disabled;

  @override
  void initState() {
    name.text = GetStorageHelper.get_box("user").read("user_name") ?? "";
    phone.text = GetStorageHelper.get_box("user").read("user_phone") ?? "";
    location.text = GetStorageHelper.get_box("user").read("user_locctin") ?? "";
  }

  @override
  Widget build(BuildContext context) {
    // getInfo();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration:
              BoxDecoration(gradient: LinearGradient(colors: gradientColors)),
          child: Form(
            key: FormKey,
            autovalidateMode: _validate,
            child: ListView(
              children: [
                customHeadingSP(
                  head: 'معلومات شخصية',
                ),
                customImage(),
                Customfiled(
                  lable: "اسم المستخدم",
                  validate: validateName,
                  controller: name,
                ),
                Customfiled(
                  lable: "رقم الجوال",
                  validate: validateMobile,
                  controller: phone,
                ),
                Visibility(
                    visible: false,
                    child:
                        Customfiled(lable: "الايميل", validate: validateEmail)),
                Customfiled(
                  lable: "الموقع",
                  validate: validateName,
                  controller: location,
                ),
                Visibility(
                    visible: false,
                    child:
                        Customfiled(lable: "المهنة", validate: validateName)),
                customButtomElev(
                  lable: 'حفظ',
                  backColor: COLOR_PRIMARY,
                  onPressedFun: () {
                    if (FormKey.currentState!.validate()) return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
