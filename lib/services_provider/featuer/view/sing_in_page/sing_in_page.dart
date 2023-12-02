import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/services_provider/core/helper/ui_helper.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/core/widgets/custom_elevbutton.dart';
import 'package:app/services_provider/core/widgets/custom_filed.dart';
import 'package:app/services_provider/core/widgets/custom_heda.dart';
import 'package:app/services_provider/core/widgets/custom_image.dart';
import 'package:app/services_provider/featuer/view/dashbord/dashborad.dart';
import 'package:flutter/material.dart';

class Sing_in_page extends StatefulWidget {
  const Sing_in_page({super.key});
  static const String ROUTE = "sing_in";

  @override
  State<Sing_in_page> createState() => _sing_in_pageState();
}

class _sing_in_pageState extends State<Sing_in_page> {
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
                  customHeadingSP(head: 'مستخدم جديد'),
                  SizedBox(
                    height: spacer * 2,
                  ),
                  customImage(),
                  Customfiled(lable: "اسم المستخدم", validate: validateName),
                  Customfiled(
                    lable: "رقم الهاتف",
                    validate: validateMobile,
                    filedType: TextInputType.number,
                  ),
                  customButtomElev(
                    lable: 'تسجيل',
                    backColor: COLOR_PRIMARY,
                    onPressedFun: () {
                      if (FormKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(
                            context, Dashboard.ROUTE);
                      }
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
