import 'package:app/Data/media_icon.dart';
import 'package:app/routeNames.dart';
import 'package:app/theme/colors.dart';
import 'package:app/theme/padding.dart';
import 'package:app/widgets/cuntom_Elevated_button.dart';
import 'package:app/widgets/custom_text_fild.dart';
import 'package:app/widgets/custom_title_subtitle.dart';
import 'package:app/widgets/custoum_sing_up_w_social_media.dart';
import 'package:flutter/material.dart';

class CreateAccounte extends StatefulWidget {
  CreateAccounte({super.key});
  static String Route = createAccount;

  @override
  State<CreateAccounte> createState() => _CreateAccounteState();
}

class _CreateAccounteState extends State<CreateAccounte> {
  var emailControl = TextEditingController();
  var passControl = TextEditingController();
  var RpassControl = TextEditingController();
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
          "CREATE AN ACCOUNT",
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
                  child: Column(
                    children: [
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
                      customTextFild(
                        ispassword: true,
                        controller: RpassControl,
                        labelFild: "Re-Password",
                        borderColor: white,
                        borderWidth: 1,
                        suffixIcon: Icons.remove_red_eye,
                      ),
                      SizedBox(
                        height: spacer,
                      ),
                      customElevatedButton(
                        navigator: verifictionPage,
                        TextValue: "create an account",
                        textColor: black,
                      ),
                      SizedBox(
                        height: miniSpacer - 2,
                      ),
                    ],
                  )),
              customTitleSubtitle(
                tilte: "by sigrin up you to agree to our privcey",
                subtitle: "privecy and trems",
                subtitlecolor: yellow,
              ),
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
                      text: "allredy have an account ",
                      style: TextStyle(color: white)),
                  TextSpan(text: "sing in ", style: TextStyle(color: yellow)),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
