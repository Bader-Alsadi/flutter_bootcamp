import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/services_provider/core/helper/ui_helper.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/core/them/padding.dart';
import 'package:app/services_provider/core/them/text_style.dart';
import 'package:app/services_provider/core/widgets/custom_elevbutton.dart';
import 'package:app/services_provider/core/widgets/custom_filed.dart';
import 'package:app/services_provider/core/widgets/custom_heda.dart';
import 'package:app/services_provider/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class PresonalInfomation extends StatefulWidget {
  const PresonalInfomation({super.key});
  static const String ROUTE ="presonal_information";

  @override
  State<PresonalInfomation> createState() => _PresonalInfomationState();
}

class _PresonalInfomationState extends State<PresonalInfomation> {
  final GlobalKey<FormState> FormKey = GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
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
                Customfiled(lable: "اسم المستخدم", validate: validateName),
                Customfiled(lable: "رقم الجوال", validate: validateMobile),
                Customfiled(lable: "الايميل", validate: validateEmail),
                Customfiled(lable: "الموقع", validate: validateName),
                Customfiled(lable: "المهنة", validate: validateName),
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
