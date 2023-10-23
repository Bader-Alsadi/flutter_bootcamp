import 'package:app/movie_app/core/Data/media_icon.dart';
import 'package:app/movie_app/core/routeNames.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/movie_app/core/widgets/coustom_abb_bar.dart';
import 'package:app/movie_app/core/widgets/cuntom_Elevated_button.dart';
import 'package:app/movie_app/core/widgets/custom_text_fild.dart';
import 'package:app/movie_app/core/widgets/custoum_sing_up_w_social_media.dart';
import 'package:flutter/material.dart';

class SingInPage extends StatefulWidget {
  SingInPage({super.key});

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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: customAppBar(
            title: "sinn in to your account",
          )),
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
