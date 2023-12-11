import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/services_provider/core/helper/db_helper.dart';
import 'package:app/services_provider/core/helper/get_storge_helper.dart';
import 'package:app/services_provider/core/helper/ui_helper.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/core/widgets/custom_elevbutton.dart';
import 'package:app/services_provider/core/widgets/custom_filed.dart';
import 'package:app/services_provider/core/widgets/custom_heda.dart';
import 'package:app/services_provider/featuer/view/dashbord/dashborad.dart';
import 'package:flutter/material.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});
  static const String ROUTE = "login_page";

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final GlobalKey<FormState> FormKey = GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

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
                    head: 'تسجيل الدخول',
                  ),
                  SizedBox(
                    height: spacer * 3,
                  ),
                  Icon(
                    Icons.lock_open_rounded,
                    color: COLOR_PRIMARY,
                    size: 80,
                  ),
                  Customfiled(
                    lable: "اسم المستخدم",
                    validate: validateName,
                    controller: name,
                  ),
                  Customfiled(
                    lable: "رقم الهاتف",
                    validate: validateMobile,
                    filedType: TextInputType.number,
                    controller: phone,
                  ),
                  customButtomElev(
                      lable: 'تسجيل',
                      backColor: COLOR_PRIMARY,
                      onPressedFun: () async {
                        if (FormKey.currentState!.validate()) {
                          List user = await DBhelper.database.userDao
                              .getUserByname(phone.text);
                          print("id ${user.first.id}");
                          if (user.first.id > 0) {
                            Navigator.pushReplacementNamed(
                                context, Dashboard.ROUTE,
                                arguments: user.first.id);
                            showSnackBar(context, "تمت التسجيل");
                            GetStorageHelper.get_box("user")
                                .write("user_id", user.first.id);
                            GetStorageHelper.get_box("user")
                                .write("user_name", name.text);
                            GetStorageHelper.get_box("user")
                                .write("user_phone", phone.text);
                            Navigator.pushReplacementNamed(
                                context, Dashboard.ROUTE,
                                arguments: user.first.id);
                          } else
                            showSnackBar(context, "لم تتم التسجيل");
                        }
                      }),
                ],
              ),
            )),
      ),
    );
  }
}
