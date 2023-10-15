import 'package:app/routeNames.dart';
import 'package:app/theme/colors.dart';
import 'package:app/theme/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class verificaton_code_page extends StatefulWidget {
  verificaton_code_page({super.key});
  static String Route = verifictionPage;

  @override
  State<verificaton_code_page> createState() => _verificaton_code_pageState();
}

class _verificaton_code_pageState extends State<verificaton_code_page> {
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
          "Veifircation code".toUpperCase(),
          style: TextStyle(color: white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(appPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                  4,
                  (index) => SizedBox(
                        height: 60,
                        width: 50,
                        child: TextFormField(
                          style: TextStyle(color: white, fontSize: 20),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (index == 3)
                              Navigator.pushNamed(context, homeScreen);
                          },
                          decoration: InputDecoration(
                              hintText: "0",
                              hintStyle: TextStyle(color: white, fontSize: 20),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      )),
            ),
            SizedBox(
              height: spacer,
            ),
            RichText(
                text: TextSpan(
              children: [
                TextSpan(
                    text: "Didn\'t recelve it? ",
                    style: TextStyle(color: white)),
                TextSpan(text: "click here ", style: TextStyle(color: yellow)),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
