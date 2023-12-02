import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/services_provider/core/helper/ui_helper.dart';
import 'package:app/services_provider/core/them/colors.dart';
import 'package:app/services_provider/core/widgets/custom_elevbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({super.key});
  static const String ROUTE ="validtion_page";

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: spacer * 2,
                ),
                SvgPicture.asset(
                  "assets/svg_image/message-text-svgrepo-com.svg",
                  height: 100,
                  width: 100,
                  colorFilter: ColorFilter.mode(COLOR_PRIMARY, BlendMode.srcIn),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "تم ارسل كود تحقق الى رقم هاتفك",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: spacer * 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      4,
                      (index) => SizedBox(
                            height: 60,
                            width: 50,
                            child: TextFormField(
                                style: TextStyle(color: black, fontSize: 20),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  // if (index == 3)
                                  // Navigator.pushNamed(context, );
                                },
                                decoration: getInputDecoration(
                                    hint: "0",
                                    darkMode: isDarkMode(context),
                                    errorColor:
                                        Theme.of(context).colorScheme.error)),
                          )),
                ),
                customButtomElev(
                  backColor: COLOR_PRIMARY,
                  lable: "تحقق",
                ),
                SizedBox(
                  height: spacer / 2,
                ),
                Text(
                  "ارسل مرة اخرى",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
