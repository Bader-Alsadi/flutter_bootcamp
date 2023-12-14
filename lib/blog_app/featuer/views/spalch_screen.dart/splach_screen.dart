import 'package:app/blog_app/featuer/views/display_page/dispaly_page.dart';
import 'package:app/blog_app/featuer/views/login_page/login.dart';
import 'package:app/services_provider/core/helper/get_storge_helper.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatelessWidget {
  SplachScreen({super.key});
  static const String ROUTE = "splash";
  String name = GetStorageHelper.get_box("user").read("name");
  String? tokken = GetStorageHelper.get_box("user").read("token");

  @override
  Widget build(BuildContext context) {
    check(context);
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: gradientColors)),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/splachImag.gif"),
            Text(
              "welcom",
              style: TextStyle(
                color: COLOR_PRIMARY,
                fontSize: 50,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )),
      ),
    );
  }

  check(BuildContext context) async {
    await Future.delayed(Duration(seconds: 7));
    if (tokken != null) {
      Navigator.pushReplacementNamed(context, HomePage.ROUTE);

    } else {
      Navigator.pushReplacementNamed(context, Login.ROUTE);
    }
  }
}
