import 'package:app/Data/start_by_create_account.dart';
import 'package:app/routeNames.dart';
import 'package:app/theme/colors.dart';
import 'package:app/theme/padding.dart';
import 'package:app/widgets/cuntom_Elevated_button.dart';
import 'package:app/widgets/started_create.dart';
import 'package:flutter/material.dart';

class StartByCreateAccount extends StatefulWidget {
  StartByCreateAccount({super.key});
  static String Route = startCreatAncouuntPage;

  @override
  State<StartByCreateAccount> createState() => _StartByCreateAccountState();
}

class _StartByCreateAccountState extends State<StartByCreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary,
        body: Container(
          padding:
              EdgeInsets.symmetric(horizontal: spacer, vertical: smallSpacer),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StartCreatePage(
                pageData: startCreatePageData,
              ),
              customElevatedButton(
                navigator: createAccount,
                TextValue: "create an account",
                textColor: black,
              ),
              SizedBox(
                height: miniSpacer,
              ),
              customElevatedButton(
                navigator: singin,
                TextValue: "sing in",
                backgroundColor: white,
                textColor: black,
              )
            ],
          ),
        ));
  }
}
