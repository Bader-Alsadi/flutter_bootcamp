import 'package:app/movie_app/core/routeNames.dart';
import 'package:app/movie_app/core/theme/colors.dart';
import 'package:app/movie_app/core/theme/padding.dart';
import 'package:app/movie_app/core/widgets/coustom_abb_bar.dart';
import 'package:app/movie_app/core/widgets/cuntom_Elevated_button.dart';
import 'package:app/movie_app/featuers/pages/payments_pages/widgets/Custom_Text_Field_OutLine.dart';
import 'package:app/movie_app/featuers/pages/payments_pages/widgets/custom_smale_field.dart';
import 'package:flutter/material.dart';

class PaymentMathod extends StatefulWidget {
  const PaymentMathod({super.key});

  @override
  State<PaymentMathod> createState() => _PaymentMathodState();
}

class _PaymentMathodState extends State<PaymentMathod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: customAppBar(title: "payment mathod")),
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: smallSpacer, vertical: smallSpacer)
                .copyWith(top: 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Card number",
                    style: TextStyle(color: white),
                  ),
                  Image.asset(
                    "assets/image/movise/mastercard.png",
                    height: 40,
                    width: 50,
                  ),
                ],
              ),
              SizedBox(
                height: miniSpacer,
              ),
              CustomTextFieldOutLine(
                width: MediaQuery.sizeOf(context).width,
              ),
              Row(
                children: [
                  coustomSmallTextFiled(context, headText: "Expier Data"),
                  SizedBox(
                    width: miniSpacer,
                  ),
                  coustomSmallTextFiled(context, headText: "CVV/CVC"),
                ],
              ),
              SizedBox(
                height: spacer,
              ),
              customElevatedButton(
                navigator: categorypay,
                TextValue: "pay now",
                textColor: yellow,
                backgroundColor: divider,
                width: MediaQuery.of(context).size.width / 1.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
