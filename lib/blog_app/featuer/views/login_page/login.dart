import 'package:app/blog_app/featuer/models/user.dart';
import 'package:app/blog_app/featuer/viewmodels/user_vm.dart';
import 'package:app/blog_app/featuer/views/display_page/dispaly_page.dart';
import 'package:app/blog_app/featuer/views/errors/errer_page.dart';
import 'package:app/blog_app/featuer/views/no_connection/no_concttion.dart';
import 'package:app/blog_app/featuer/views/singin_page/singim_page.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/services_provider/core/helper/ui_helper.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/core/widgets/custom_elevbutton.dart';
import 'package:app/services_provider/core/widgets/custom_filed.dart';
import 'package:app/services_provider/core/widgets/custom_heda.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});
  static const String ROUTE = "login_page";

  final GlobalKey<FormState> FormKey = GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  UserVM uvm = UserVM();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration:
              BoxDecoration(gradient: LinearGradient(colors: gradientColors)),
          child: Form(
            key: FormKey,
            autovalidateMode: _validate,
            child: ListView(
              children: [
                customHeadingSP(
                  head: 'Login',
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
                  lable: "user email",
                  // validate: validateEmail,
                  controller: email,
                ),
                Customfiled(
                  lable: "password",
                  controller: password,
                ),
                customButtomElev(
                    lable: "loging",
                    backColor: COLOR_PRIMARY,
                    onPressedFun: () async {
                      if (FormKey.currentState!.validate()) {
                        User user =
                            User(email: email.text, password: password.text);
                        int code = await uvm.Login(user);

                        if (code == 1200) {
                          showSnackBar(context, "succssfuly");
                          Navigator.pushReplacementNamed(
                              context, HomePage.ROUTE);
                        } else if (code == 1300) {
                          showSnackBar(
                              context, "incorrect user name or password");
                        } else if (code == 404) {
                          Navigator.pushNamed(context, Error404.ROUTE);
                        } else {
                          Navigator.pushNamed(context, NoconnectionPage.ROUTE);
                        }
                      }
                    }),
                SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("I Dont Have account ", style: TextStyle(color: black)),
                  InkWell(
                    onTap: () {
                      Navigator.popAndPushNamed(context, Singin.ROUTE);
                    },
                    child: Text("sing in",
                        style: TextStyle(
                            color: COLOR_PRIMARY,
                            decoration: TextDecoration.underline)),
                  ),
                ]),
              ],
            ),
          )),
    );
  }
}
