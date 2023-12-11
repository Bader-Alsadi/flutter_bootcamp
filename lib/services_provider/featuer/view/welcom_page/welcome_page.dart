import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/core/widgets/custom_elevbutton.dart';
import 'package:app/services_provider/featuer/view/login_page/login_page.dart';
import 'package:app/services_provider/featuer/view/sing_in_page/sing_in_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  static const String ROUTE = "Welcome_page";

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: gradientColors)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/logoSP.png',
                width: 150.0,
                height: 150.0,
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 8),
              child: Text(
                'اهلا وسهلا بكم في تطبيق منفعة ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: COLOR_PRIMARY,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            //   child: Text(
            //     'عميلانا العزيز نحن سعداء بخدمتك',
            //     style: TextStyle(fontSize: 18),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            customButtomElev(
              lable: 'مستخدم سابق',
              backColor: COLOR_PRIMARY.withOpacity(0.7),
              onPressedFun: () {
                Navigator.pushNamed(context, login_page.ROUTE);
              },
            ),

            customButtomElev(
              lable: 'مستخدم جديد',
              backColor: COLOR_SECONDRY.withOpacity(0.7),
              onPressedFun: () {
                Navigator.pushNamed(context, Sing_in_page.ROUTE);
              },
            ),
          ],
        ),
      ),
    );
  }
}
