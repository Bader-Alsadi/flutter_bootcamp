import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/services_provider/core/helper/db_helper.dart';
import 'package:app/services_provider/core/helper/get_storge_helper.dart';
import 'package:app/services_provider/core/helper/ui_helper.dart';
import 'package:app/services_provider/core/local_database/entities/location_entity.dart';
import 'package:app/services_provider/core/local_database/entities/user_entity.dart';
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
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();

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
                  Customfiled(
                    lable: " الموقع",
                    validate: validateLocatin,
                    controller: location,
                  ),
                  customButtomElev(
                    lable: 'تسجيل',
                    backColor: COLOR_PRIMARY,
                    onPressedFun: () async {
                      if (FormKey.currentState!.validate()) {
                        int loc_id = 0;
                        User user = User(
                            user_name: name.text,
                            cell_phone: phone.text,
                            area_id: 1);
                        int user_id =
                            await DBhelper.database.userDao.insertUser(user);
                        if (user_id > 0) {
                          loc_id = await DBhelper.database.locationDao
                              .insertLocation(Location(
                                  descripction: location.text,
                                  user_id: user_id));
                        }
                        if (user_id > 0 && loc_id > 0) {
                          GetStorageHelper.get_box("user")
                              .write("user_id", user_id);
                          GetStorageHelper.get_box("user")
                              .write("user_name", name.text);
                          GetStorageHelper.get_box("user")
                              .write("user_phone", phone.text);
                          GetStorageHelper.get_box("user")
                              .write("user_locctin", location.text);
                          showSnackBar(context, "تمت التسجيل");

                          Navigator.pushReplacementNamed(
                              context, Dashboard.ROUTE,
                              arguments: user_id);
                        } else
                          showSnackBar(context, "لم تتم التسجيل");
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
