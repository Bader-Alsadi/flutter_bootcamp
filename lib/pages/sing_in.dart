import 'package:app/Data/media_icon.dart';
import 'package:app/routeNames.dart';
import 'package:app/theme/colors.dart';
import 'package:app/theme/padding.dart';
import 'package:app/widgets/cuntom_Elevated_button.dart';
import 'package:app/widgets/custom_text_fild.dart';
import 'package:app/widgets/custoum_sing_up_w_social_media.dart';
import 'package:flutter/material.dart';

class SingInPage extends StatefulWidget {
  SingInPage({super.key});
  static String Route = singin;

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  var emailControl = TextEditingController();
  var passControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: white,
        ),
        backgroundColor: secondary,
        title: Text(
          "SIGN IN TO YOUR ACCOUNT",
          style: TextStyle(color: white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(appPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: spacer),
              Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(children: [
                    customTextFild(
                      controller: emailControl,
                      regExp: "^/w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}\$/",
                      labelFild: "Emali",
                      borderColor: white,
                      borderWidth: 1,
                    ),
                    customTextFild(
                      ispassword: true,
                      controller: passControl,
                      labelFild: "Password",
                      borderColor: white,
                      borderWidth: 1,
                      suffixIcon: Icons.remove_red_eye,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "forget your password?",
                        style: TextStyle(color: white),
                      ),
                    ),
                    SizedBox(
                      height: spacer,
                    ),
                    customElevatedButton(
                      navigator: homeScreen,
                      TextValue: "sing in",
                      textColor: black,
                    ),
                  ])),
              SizedBox(
                height: spacer,
              ),
              custoumSinginWithSocialMedai(
                mediaData: mediaIconLits,
                textAboveIcons: "sing up with social media",
                textColor: white,
                firstIcon: Icons.mail,
                secondIcon: Icons.facebook,
                thirdIcon: Icons.one_x_mobiledata,
              ),
              SizedBox(
                height: spacer,
              ),
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                      text: "Not a member ", style: TextStyle(color: white)),
                  TextSpan(text: "sing up ", style: TextStyle(color: yellow)),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
